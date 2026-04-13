import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'on_route_search_widget.dart' show OnRouteSearchWidget;
import 'package:flutter/material.dart';

class OnRouteSearchModel extends FlutterFlowModel<OnRouteSearchWidget> {
  ///  Local state fields for this page.

  List<LatLng> filteredWaypoints = [];
  void addToFilteredWaypoints(LatLng item) => filteredWaypoints.add(item);
  void removeFromFilteredWaypoints(LatLng item) =>
      filteredWaypoints.remove(item);
  void removeAtIndexFromFilteredWaypoints(int index) =>
      filteredWaypoints.removeAt(index);
  void insertAtIndexInFilteredWaypoints(int index, LatLng item) =>
      filteredWaypoints.insert(index, item);
  void updateFilteredWaypointsAtIndex(int index, Function(LatLng) updateFn) =>
      filteredWaypoints[index] = updateFn(filteredWaypoints[index]);

  List<dynamic> rawStations = [];
  void addToRawStations(dynamic item) => rawStations.add(item);
  void removeFromRawStations(dynamic item) => rawStations.remove(item);
  void removeAtIndexFromRawStations(int index) => rawStations.removeAt(index);
  void insertAtIndexInRawStations(int index, dynamic item) =>
      rawStations.insert(index, item);
  void updateRawStationsAtIndex(int index, Function(dynamic) updateFn) =>
      rawStations[index] = updateFn(rawStations[index]);

  List<dynamic> cleanStations = [];
  void addToCleanStations(dynamic item) => cleanStations.add(item);
  void removeFromCleanStations(dynamic item) => cleanStations.remove(item);
  void removeAtIndexFromCleanStations(int index) =>
      cleanStations.removeAt(index);
  void insertAtIndexInCleanStations(int index, dynamic item) =>
      cleanStations.insert(index, item);
  void updateCleanStationsAtIndex(int index, Function(dynamic) updateFn) =>
      cleanStations[index] = updateFn(cleanStations[index]);

  dynamic boundsResult;

  List<dynamic> finalStationsList = [];
  void addToFinalStationsList(dynamic item) => finalStationsList.add(item);
  void removeFromFinalStationsList(dynamic item) =>
      finalStationsList.remove(item);
  void removeAtIndexFromFinalStationsList(int index) =>
      finalStationsList.removeAt(index);
  void insertAtIndexInFinalStationsList(int index, dynamic item) =>
      finalStationsList.insert(index, item);
  void updateFinalStationsListAtIndex(int index, Function(dynamic) updateFn) =>
      finalStationsList[index] = updateFn(finalStationsList[index]);

  List<LatLng> mapPins = [];
  void addToMapPins(LatLng item) => mapPins.add(item);
  void removeFromMapPins(LatLng item) => mapPins.remove(item);
  void removeAtIndexFromMapPins(int index) => mapPins.removeAt(index);
  void insertAtIndexInMapPins(int index, LatLng item) =>
      mapPins.insert(index, item);
  void updateMapPinsAtIndex(int index, Function(LatLng) updateFn) =>
      mapPins[index] = updateFn(mapPins[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (Google Geocoding)] action in Container widget.
  ApiCallResponse? apiResultglv;
  // State field(s) for PlacePickerStart widget.
  FFPlace placePickerStartValue = FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (Google Maps Route)] action in Button widget.
  ApiCallResponse? routeResponse;
  // Stores action output result for [Backend Call - API (Google Maps Search Nearby)] action in Button widget.
  ApiCallResponse? apiResultier;
  // Stores action output result for [Backend Call - API (Google Geocoding)] action in Button widget.
  ApiCallResponse? apiResultLatLng;
  // Stores action output result for [Backend Call - API (Gas Station List)] action in Button widget.
  ApiCallResponse? pricingApiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
