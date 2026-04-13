import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for enterEmail widget.
  FocusNode? enterEmailFocusNode;
  TextEditingController? enterEmailTextController;
  String? Function(BuildContext, String?)? enterEmailTextControllerValidator;
  // State field(s) for enterPass widget.
  FocusNode? enterPassFocusNode;
  TextEditingController? enterPassTextController;
  late bool enterPassVisibility;
  String? Function(BuildContext, String?)? enterPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    enterPassVisibility = false;
  }

  @override
  void dispose() {
    enterEmailFocusNode?.dispose();
    enterEmailTextController?.dispose();

    enterPassFocusNode?.dispose();
    enterPassTextController?.dispose();
  }
}
