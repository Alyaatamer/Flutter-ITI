import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day9/features/conversations/models/user_model.dart';
import 'package:day9/features/messages/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesProvider extends ChangeNotifier {
  final messageController = TextEditingController();

  void sendMessage(UserModel userModel) async {
    if (messageController.text.isEmpty) return;
    final messageId = DateTime.now().millisecondsSinceEpoch.toString();
    await FirebaseFirestore.instance.collection('messages').doc(messageId).set({
      'id': messageId,
      'senderUid': FirebaseAuth.instance.currentUser!.uid,
      'receiverUid': userModel.uid,
      'sentAt': DateTime.now().toString(),
      'message': messageController.text,
    });
    messageController.clear();
  }

  List<MessageModel> messages = [];
  void getAllMessages(UserModel user) async {
    FirebaseFirestore.instance
        .collection('messages')
        .where(
          'senderUid',
          whereIn: [FirebaseAuth.instance.currentUser!.uid, user.uid],
        )
        .where(
          'receiverUid',
          whereIn: [FirebaseAuth.instance.currentUser!.uid, user.uid],
        )
        .snapshots()
        .listen((event) {
          messages.clear();
          for (var doc in event.docs) {
            final message = MessageModel.fromMap(doc.data());
            messages.add(message);
          }
          notifyListeners();
        });
  }
}
