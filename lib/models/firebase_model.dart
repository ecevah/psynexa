import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chats {
  final List<ChatModel> chats;
  Chats({required this.chats});

  factory Chats.fromJson(Map<String, dynamic>? json) {
    List<ChatModel> chats = [];
    if (json != null) {
      for (var i in json['prompt']) {
        chats.add(ChatModel.fromJson(i));
      }
    }

    return Chats(chats: chats);
  }
}

class ChatModel {
  final String message, role;
  final DateTime date;

  ChatModel({required this.date, required this.message, required this.role});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = (json['date'] as Timestamp).toDate();

    return ChatModel(
      date: dateTime,
      message: json['message'],
      role: json['role'],
    );
  }
}
