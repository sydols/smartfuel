import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_map_search_widget.dart' show NearbyMapSearchWidget;
import 'package:flutter/material.dart';

class NearbyMapSearchModel extends FlutterFlowModel<NearbyMapSearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
