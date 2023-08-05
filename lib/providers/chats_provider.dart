import 'package:flutter/cupertino.dart';

import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId, required String overviewText}) async {
      String question = '''$msg\n \n If you can't find the answer to this question in the text below, write "I can't help you with this question" as a response, don't write anything else.\n $overviewText''';
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: question,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: question,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}
