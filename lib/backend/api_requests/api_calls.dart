import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoogleMapsSearchNearbyCall {
  static Future<ApiCallResponse> call({
    double? lat = 37.7937,
    double? lng = -122.3965,
    double? radius = 500,
    int? resultCount = 10,
  }) async {
    final ffApiRequestBody = '''
{
  "includedTypes": [
    "gas_station",
    "electric_vehicle_charging_station"
  ],
  "maxResultCount": ${resultCount},
  "locationRestriction": {
    "circle": {
      "center": {
        "latitude": ${lat},
        "longitude": ${lng}
      },
      "radius": ${radius}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Google Maps Search Nearby',
      apiUrl: 'https://places.googleapis.com/v1/places:searchNearby',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': 'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
        'X-Goog-FieldMask': 'places.displayName,places.formattedAddress',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? formattedAddress(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].formattedAddress''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? displayName(dynamic response) => (getJsonField(
        response,
        r'''$.places[:].displayName.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? allPlaces(dynamic response) => getJsonField(
        response,
        r'''$.places''',
        true,
      ) as List?;
}

class GoogleMapsRouteCall {
  static Future<ApiCallResponse> call({
    double? originLat = 37.419734,
    double? originLng = -122.0827784,
    double? destLat = 37.417670,
    double? destLng = -122.079595,
  }) async {
    final ffApiRequestBody = '''
{
  "origin":{
    "location":{
      "latLng":{
        "latitude": ${originLat},
        "longitude": ${originLng}
      }
    }
  },
  "destination":{
    "location":{
      "latLng":{
        "latitude": ${destLat},
        "longitude": ${destLng}
      }
    }
  },
  "travelMode": "DRIVE",
  "routingPreference": "TRAFFIC_AWARE",
  "computeAlternativeRoutes": false,
  "routeModifiers": {
    "avoidTolls": false,
    "avoidHighways": false,
    "avoidFerries": false
  },
  "languageCode": "en-US",
  "units": "METRIC"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Google Maps Route',
      apiUrl: 'https://routes.googleapis.com/directions/v2:computeRoutes',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': 'AIzaSyApoT7jBvPSLIYoGDjBGQ2lZVrJFqrhh1k',
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GoogleGeocodingCall {
  static Future<ApiCallResponse> call({
    String? addressString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Geocoding',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': addressString,
        'key': "AIzaSyCEdNlSvaZ2vMQk0m998W68Gz6_O33SXpo",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      );
  static dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      );
  static dynamic formattedAddress(dynamic response) => getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
