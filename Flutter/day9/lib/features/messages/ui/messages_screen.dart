import 'package:day9/core/style/app_colors.dart';
import 'package:day9/core/widgets/custom_text_field.dart';
import 'package:day9/features/conversations/models/user_model.dart';
import 'package:day9/features/messages/logic/messages_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  final UserModel userModel;
  const MessagesScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesProvider()..getAllMessages(userModel),
      builder: (context, child) {
        final provider = context.read<MessagesProvider>();
        return Scaffold(
          appBar: AppBar(title: Text(userModel.name)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Consumer<MessagesProvider>(
                      builder: (context, value, child) => ListView.separated(
                        itemBuilder: (context, index) {
                          final message = provider.messages[index];
                          final bool isSender =
                              message.senderUid ==
                              FirebaseAuth.instance.currentUser!.uid;
                          final width = MediaQuery.sizeOf(context).width;
                          return Container(
                            margin: EdgeInsets.only(
                              right: isSender ? width * 0.2 : 0,
                              left: isSender ? 0 : width * 0.2,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSender
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: isSender
                                    ? Radius.circular(12)
                                    : Radius.zero,
                                bottomLeft: isSender
                                    ? Radius.zero
                                    : Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: Text(
                                    provider.messages[index].message,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Text(
                                  provider.messages[index].sentAt.split(' ')[0],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: provider.messages.length,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: provider.messageController,
                          hintText: 'Enter message here..',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.sendMessage(userModel);
                        },
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
