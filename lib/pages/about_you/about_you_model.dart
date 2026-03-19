import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'about_you_widget.dart' show AboutYouWidget;
import 'package:flutter/material.dart';

class AboutYouModel extends FlutterFlowModel<AboutYouWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for enterName widget.
  FocusNode? enterNameFocusNode;
  TextEditingController? enterNameTextController;
  String? Function(BuildContext, String?)? enterNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for enterMpg widget.
  FocusNode? enterMpgFocusNode;
  TextEditingController? enterMpgTextController;
  String? Function(BuildContext, String?)? enterMpgTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterNameFocusNode?.dispose();
    enterNameTextController?.dispose();

    enterMpgFocusNode?.dispose();
    enterMpgTextController?.dispose();
  }
}
