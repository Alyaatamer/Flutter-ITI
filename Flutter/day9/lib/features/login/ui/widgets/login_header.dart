import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back 👋',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text('Sign in to continue', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
