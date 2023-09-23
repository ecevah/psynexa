import 'package:flutter/material.dart';
import '../models/chatbot/chatbot.dart';

class listRiverpod extends ChangeNotifier {
  List<chatModel> chatlist = [];
  void setChatList(chatModel index) {
    chatlist.add(index);
    notifyListeners();
  }
}
