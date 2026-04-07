import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Takes the user's current location in LatLng form and outputs it as a
/// doubles for Lat.
double currLocationToLat(LatLng currLocation) {
  return currLocation.latitude;
}

/// Takes location as LatLng data and outputs the Lng as a double.
double currLocationtoLng(LatLng currLocation) {
  return currLocation.longitude;
}

/// translate the encoded polyline string into a usable List of LatLng
/// coordinates.
///
/// This standard decoding algorithm loops through the compressed ASCII string
/// returned by the Google Maps Routes API, applying bitwise operations to
/// extract the exact latitude and longitude waypoints along your commuter's
/// route
List<LatLng> decodePolyline(String encoded) {
  List<LatLng> polylineCoordinates = [];
  int index = 0, len = encoded.length;
  int lat = 0, lng = 0;

  while (index < len) {
    int b, shift = 0, result = 0;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);

    // Replaced bitwise NOT (~) with mathematical negation for web compilation safety
    int dlat = ((result & 1) != 0 ? -((result >> 1) + 1) : (result >> 1));
    lat += dlat;

    shift = 0;
    result = 0;
    do {
      b = encoded.codeUnitAt(index++) - 63;
      result |= (b & 0x1f) << shift;
      shift += 5;
    } while (b >= 0x20);

    // Replaced bitwise NOT (~) with mathematical negation for web compilation safety
    int dlng = ((result & 1) != 0 ? -((result >> 1) + 1) : (result >> 1));
    lng += dlng;

    polylineCoordinates.add(LatLng(lat / 1E5, lng / 1E5));
  }
  return polylineCoordinates;
}

List<LatLng> filterCoordinatesByDistance(
  List<LatLng> points,
  double intervalMeters,
) {
  if (points.isEmpty) return [];

  List<LatLng> filteredPoints = [points.first];
  LatLng lastAddedPoint = points.first;

  for (int i = 1; i < points.length; i++) {
    double distance = _calculateHaversineDistance(lastAddedPoint, points[i]);
    if (distance >= intervalMeters) {
      filteredPoints.add(points[i]);
      lastAddedPoint = points[i];
    }
  }
  return filteredPoints;
}

double _calculateHaversineDistance(LatLng point1, LatLng point2) {
  const double earthRadius = 6371000; // Earth's radius in meters

  double lat1 = point1.latitude * math.pi / 180;
  double lng1 = point1.longitude * math.pi / 180;
  double lat2 = point2.latitude * math.pi / 180;
  double lng2 = point2.longitude * math.pi / 180;

  double dlat = lat2 - lat1;
  double dlng = lng2 - lng1;

  double a = math.sin(dlat / 2) * math.sin(dlat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dlng / 2) * math.sin(dlng / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  return earthRadius * c;
}

/// takes a List of JSON objects as its input and returns a List of JSON
/// objects as its output.
///
/// Inside this function, a Dart Set is utilized to keep track of the unique
/// Place IDs or station names that have already been processed, allowing the
/// standard for loop to seamlessly filter out any redundant locations
/// returned by your overlapping Google Places API requests.
List<dynamic> deduplicateGasStations(List<dynamic> rawStations) {
  Set<String> processedIds = {};
  List<dynamic> uniqueStations = [];

  for (var group in rawStations) {
    if (group is List) {
      for (var station in group) {
        String? stationId = station['formattedAddress'];

        if (stationId != null && !processedIds.contains(stationId)) {
          processedIds.add(stationId);
          uniqueStations.add(station);
        }
      }
    } else if (group is Map) {
      String? stationId = group['formattedAddress'];

      if (stationId != null && !processedIds.contains(stationId)) {
        processedIds.add(stationId);
        uniqueStations.add(group);
      }
    }
  }

  return uniqueStations;
}

List<LatLng> combineLocationstoList(
  LatLng? startLocation,
  LatLng? endLocation,
) {
  List<LatLng> combinedList = [];

  if (startLocation != null) {
    combinedList.add(startLocation);
  }

  if (endLocation != null) {
    combinedList.add(endLocation);
  }

  return combinedList;
}

dynamic calculateMapBounds(List<LatLng>? routePoints) {
  if (routePoints == null || routePoints.isEmpty) {
    return {"centerLat": 0.0, "centerLng": 0.0, "zoom": 12.0};
  }

  double minLat = routePoints.first.latitude;
  double maxLat = routePoints.first.latitude;
  double minLng = routePoints.first.longitude;
  double maxLng = routePoints.first.longitude;

  for (var point in routePoints) {
    if (point.latitude < minLat) minLat = point.latitude;
    if (point.latitude > maxLat) maxLat = point.latitude;
    if (point.longitude < minLng) minLng = point.longitude;
    if (point.longitude > maxLng) maxLng = point.longitude;
  }

  double centerLat = (minLat + maxLat) / 2;
  double centerLng = (minLng + maxLng) / 2;

  double latDiff = maxLat - minLat;
  double lngDiff = maxLng - minLng;
  double maxDiff = latDiff > lngDiff ? latDiff : lngDiff;

  double zoom = 10.0;
  if (maxDiff > 0) {
    zoom = (11.5 - math.log(maxDiff) / math.log(2)).clamp(1.0, 15.0);
  }

  return {"centerLat": centerLat, "centerLng": centerLng, "zoom": zoom};
}

LatLng cmbJsonToLatLng(dynamic inputJson) {
// Extract lat and lng from the JSON object returned by calculateMapBounds
  // Default to 0.0 if for some reason the keys are missing
  double lat = inputJson['centerLat']?.toDouble() ?? 0.0;
  double lng = inputJson['centerLng']?.toDouble() ?? 0.0;

  return LatLng(lat, lng);
}

LatLng? safeBuildLatLng(
  double? lat,
  double? lng,
) {
  if (lat == null || lng == null) {
    return null;
  }
  return LatLng(lat, lng);
}

List<LatLng>? parseStationLatLng(dynamic apiResponse) {
  final results =
      apiResponse['results'] as List? ?? []; // ← 'results' not 'places'
  return results.map((r) {
    final geometry = r['geometry']['location']; // ← Google Maps structure
    return LatLng(geometry['lat'],
        geometry['lng']); // ← 'lat'/'lng' not latitude/longitude
  }).toList();
}

double calculateDistanceInMiles(
  LatLng? startLoc,
  LatLng? stationLoc,
) {
  if (startLoc == null || stationLoc == null) return 0.0;

  var dLat = (stationLoc.latitude - startLoc.latitude) * math.pi / 180;
  ;
  var dLon = (stationLoc.longitude - startLoc.longitude) * math.pi / 180;
  ;

  var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos((startLoc.latitude) * math.pi / 180) *
          math.cos((stationLoc.latitude) * math.pi / 180) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  var c = 2 * math.asin(math.sqrt(a));

  // Multiply by the radius of the Earth in miles
  double distance = 3958.8 * c;

  // Round to 1 decimal place (e.g., 4.2 miles)
  return double.parse(distance.toStringAsFixed(1));
}

List<LatLng> extractMarkersFromJson(List<dynamic>? stationList) {
  if (stationList == null || stationList.isEmpty) {
    return [];
  }

  List<LatLng> markers = [];

  for (var station in stationList) {
    // Safely extract lat and lng, defaulting to 0.0 if missing
    double lat = station['lat']?.toDouble() ?? 0.0;
    double lng = station['lng']?.toDouble() ?? 0.0;

    // Only add valid coordinates
    if (lat != 0.0 && lng != 0.0) {
      markers.add(LatLng(lat, lng));
    }
  }

  return markers;
}

LatLng? convertToLatLng(
  double? lat,
  double? lng,
) {
  // Create a function called convertToLatLng that takes two nullable doubles (double? lat, double? lng) and returns a nullable LatLng?. Inside the function, check if either lat or lng is null; if they are, return null. Otherwise, return a LatLng object using those two values
  if (lat == null || lng == null) {
    return null;
  }
  return LatLng(lat!, lng!);
}

dynamic getStationTypes(String? vehicleType) {
  if (vehicleType == 'Gas') {
    return ["gas_station"];
  } else if (vehicleType == 'Electric') {
    return ["electric_vehicle_charging_station"];
  } else {
    // Hybrid fallback
    return ["gas_station", "electric_vehicle_charging_station"];
  }
}

bool isEvChargerByName(String? stationName) {
  if (stationName == null || stationName.trim().isEmpty) {
    return false;
  }

  // 2. Convert the name to lowercase for a bulletproof search
  String nameLower = stationName.toLowerCase();

  // 3. Check if the string contains our keyword
  return nameLower.contains('char') || nameLower.contains('rivian');
}

dynamic buildStationJson(
  String? stationName,
  String? stationAddress,
  double? lat,
  double? lng,
  double? distance,
  List<dynamic> pricingList,
) {
  String rawGoogleAddress = stationAddress ?? '';
  String googleAddress =
      rawGoogleAddress.toLowerCase().replaceAll(RegExp(r'[,.]'), '');
  String stationPrice = "Price Unavailable"; // Default fallback

  if (pricingList != null) {
    for (var priceRecord in pricingList) {
      // Extract and normalize the DB street address
      String dbAddress = (priceRecord['address'] ?? '')
          .toLowerCase()
          .replaceAll(RegExp(r'[,.]'), '');

      // Extract and normalize the DB city (acts as a safety net so we don't match the same street in a different town)
      String dbCity = (priceRecord['city'] ?? '')
          .toLowerCase()
          .replaceAll(RegExp(r'[,.]'), '');

      // 3. The Fuzzy Match: Check if Google's string contains BOTH the street and the city
      if (dbAddress.isNotEmpty &&
          googleAddress.contains(dbAddress) &&
          googleAddress.contains(dbCity)) {
        // We found a match! Grab the price.
        // (You can also add logic here to check if it's an EV charger and pull that specific rate instead)
        stationPrice = "\$" + priceRecord['regularPrice'].toString();
        break; // Stop searching once we find the match
      }
    }
  }
  return {
    "name": stationName ?? "Unknown Station",
    "address": stationAddress ?? "Unknown Address",
    "price": stationPrice,
    "lat": lat ?? 0.0,
    "lng": lng ?? 0.0,
    "distance": distance ?? 0.0,
  };
}
