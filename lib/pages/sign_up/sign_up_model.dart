import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for enterEmail widget.
  FocusNode? enterEmailFocusNode;
  TextEditingController? enterEmailTextController;
  String? Function(BuildContext, String?)? enterEmailTextControllerValidator;
  // State field(s) for enterPass widget.
  FocusNode? enterPassFocusNode;
  TextEditingController? enterPassTextController;
  late bool enterPassVisibility;
  String? Function(BuildContext, String?)? enterPassTextControllerValidator;
  // State field(s) for reEnterPass widget.
  FocusNode? reEnterPassFocusNode;
  TextEditingController? reEnterPassTextController;
  late bool reEnterPassVisibility;
  String? Function(BuildContext, String?)? reEnterPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    enterPassVisibility = false;
    reEnterPassVisibility = false;
  }

  @override
  void dispose() {
    enterEmailFocusNode?.dispose();
    enterEmailTextController?.dispose();

    enterPassFocusNode?.dispose();
    enterPassTextController?.dispose();

    reEnterPassFocusNode?.dispose();
    reEnterPassTextController?.dispose();
  }
}
