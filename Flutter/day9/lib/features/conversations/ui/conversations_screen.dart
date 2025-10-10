import 'package:day9/features/conversations/logic/converssations_provider.dart';
import 'package:day9/features/conversations/ui/widgets/conversations_list_view.dart';
import 'package:day9/features/login/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConverssationsProvider()..getAllUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conversations'),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: ConversationsListView(),
      ),
    );
  }
}