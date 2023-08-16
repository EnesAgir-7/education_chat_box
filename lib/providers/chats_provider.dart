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
      
       Beziehen Sie die Frage direkt auf den Text, wenn es einen Zusammenhang gibt, antworten Sie, wenn Sie die Frage nicht auf den Text beziehen können, antworten Sie nicht "Ich kann Ihnen bei dieser Frage nicht helfen
      
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
