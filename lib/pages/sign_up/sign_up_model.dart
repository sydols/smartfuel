import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for enterEmail widget.
  FocusNode? enterEmailFocusNode;
  TextEditingController? enterEmailTextController;
  String? Function(BuildContext, String?)? enterEmailTextControllerValidator;
  // State field(s) for enterPass widget.
  FocusNode? enterPassFocusNode1;
  TextEditingController? enterPassTextController1;
  String? Function(BuildContext, String?)? enterPassTextController1Validator;
  // State field(s) for enterPass widget.
  FocusNode? enterPassFocusNode2;
  TextEditingController? enterPassTextController2;
  String? Function(BuildContext, String?)? enterPassTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterEmailFocusNode?.dispose();
    enterEmailTextController?.dispose();

    enterPassFocusNode1?.dispose();
    enterPassTextController1?.dispose();

    enterPassFocusNode2?.dispose();
    enterPassTextController2?.dispose();
  }
}
