import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to chat app 👋',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text('Create account to continue', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
