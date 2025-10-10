import 'package:day9/features/conversations/logic/converssations_provider.dart';
import 'package:day9/features/messages/ui/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConverssationsProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            final user = provider.users[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(userModel: user),
                  ),
                );
              },
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.email, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: provider.users.length,
        );
      },
    );
  }
}