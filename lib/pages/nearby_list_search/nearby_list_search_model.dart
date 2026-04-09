import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_list_search_widget.dart' show NearbyListSearchWidget;
import 'package:flutter/material.dart';

class NearbyListSearchModel extends FlutterFlowModel<NearbyListSearchWidget> {
  ///  Local state fields for this page.

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Google Geocoding)] action in Container widget.
  ApiCallResponse? apiResultglv;
  // State field(s) for PlacePickerStart widget.
  FFPlace placePickerStartValue = FFPlace();
  // Stores action output result for [Backend Call - API (Google Maps Search Nearby)] action in Button widget.
  ApiCallResponse? apiResultNearby;
  // Stores action output result for [Backend Call - API (Google Geocoding)] action in Button widget.
  ApiCallResponse? apiResultLatLng;
  // Stores action output result for [Backend Call - API (Gas Station List)] action in Button widget.
  ApiCallResponse? pricingApiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
