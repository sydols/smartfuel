import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_chat_widget.dart' show AIChatWidget;
import 'package:flutter/material.dart';

class AIChatModel extends FlutterFlowModel<AIChatWidget> {
  ///  Local state fields for this page.

  List<String> chatHistory = [];
  void addToChatHistory(String item) => chatHistory.add(item);
  void removeFromChatHistory(String item) => chatHistory.remove(item);
  void removeAtIndexFromChatHistory(int index) => chatHistory.removeAt(index);
  void insertAtIndexInChatHistory(int index, String item) =>
      chatHistory.insert(index, item);
  void updateChatHistoryAtIndex(int index, Function(String) updateFn) =>
      chatHistory[index] = updateFn(chatHistory[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (AI Chat)] action in IconButton widget.
  ApiCallResponse? aiResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
