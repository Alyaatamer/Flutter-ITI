import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day9/features/conversations/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConverssationsProvider extends ChangeNotifier {
  List<UserModel> users = [];

  void getAllUsers() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final response = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: uid)
        .get();
    for (var doc in response.docs) {
      final user = UserModel.fromMap(doc.data());
      users.add(user);
    }
    notifyListeners();
  }
}