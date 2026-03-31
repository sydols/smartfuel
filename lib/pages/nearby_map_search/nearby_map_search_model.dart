import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_map_search_widget.dart' show NearbyMapSearchWidget;
import 'package:flutter/material.dart';

class NearbyMapSearchModel extends FlutterFlowModel<NearbyMapSearchWidget> {
  ///  Local state fields for this page.

  List<dynamic> rawStations = [];
  void addToRawStations(dynamic item) => rawStations.add(item);
  void removeFromRawStations(dynamic item) => rawStations.remove(item);
  void removeAtIndexFromRawStations(int index) => rawStations.removeAt(index);
  void insertAtIndexInRawStations(int index, dynamic item) =>
      rawStations.insert(index, item);
  void updateRawStationsAtIndex(int index, Function(dynamic) updateFn) =>
      rawStations[index] = updateFn(rawStations[index]);

  List<LatLng> stationCoord = [];
  void addToStationCoord(LatLng item) => stationCoord.add(item);
  void removeFromStationCoord(LatLng item) => stationCoord.remove(item);
  void removeAtIndexFromStationCoord(int index) => stationCoord.removeAt(index);
  void insertAtIndexInStationCoord(int index, LatLng item) =>
      stationCoord.insert(index, item);
  void updateStationCoordAtIndex(int index, Function(LatLng) updateFn) =>
      stationCoord[index] = updateFn(stationCoord[index]);

  List<LatLng> stationLatLngs = [];
  void addToStationLatLngs(LatLng item) => stationLatLngs.add(item);
  void removeFromStationLatLngs(LatLng item) => stationLatLngs.remove(item);
  void removeAtIndexFromStationLatLngs(int index) =>
      stationLatLngs.removeAt(index);
  void insertAtIndexInStationLatLngs(int index, LatLng item) =>
      stationLatLngs.insert(index, item);
  void updateStationLatLngsAtIndex(int index, Function(LatLng) updateFn) =>
      stationLatLngs[index] = updateFn(stationLatLngs[index]);

  int? t1 = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (Google Maps Search Nearby)] action in Button widget.
  ApiCallResponse? placesResultCopy;
  // Stores action output result for [Backend Call - API (Google Geocoding)] action in Button widget.
  ApiCallResponse? apiResultLatLng;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
