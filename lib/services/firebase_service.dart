import 'package:Psynexa/models/firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final chatbotCol = FirebaseFirestore.instance.collection('chatBot');

  Future<Chats> getChatPosts(String chatId) async {
    final chatDoc =
        await chatbotCol.doc(chatId).get().then((value) => value.data());

    final chatsModel = Chats.fromJson(chatDoc);
    return chatsModel;
  }

  Stream<Chats> getUserPostsAsStream(String chatID) {
    final chatSnapshot = chatbotCol
        .doc(chatID)
        .snapshots()
        .map((event) => Chats.fromJson(event.data()!));
    return chatSnapshot;
  }
}
