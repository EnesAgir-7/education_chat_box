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
      String question = '''$msg
      
      Answer the question above in the language in which it is written. Pretending to be a teacher, relate the course notes you have taken from the course notes of the Abitur students below to the question above. If you cannot relate the question to the text, answer "I cannot answer this question". If there is a connection, try to give a short and clear answer. And give answers only in German,
      
       $overviewText''';
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
