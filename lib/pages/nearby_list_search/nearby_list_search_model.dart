import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_list_search_widget.dart' show NearbyListSearchWidget;
import 'package:flutter/material.dart';

class NearbyListSearchModel extends FlutterFlowModel<NearbyListSearchWidget> {
  ///  Local state fields for this page.

  double? radiusMeters;

  LatLng? currentLoc;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Google Maps Search Nearby)] action in NearbyListSearch widget.
  ApiCallResponse? apiResultakq;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
