import 'package:day9/core/style/app_themes.dart';
import 'package:day9/features/conversations/ui/conversations_screen.dart';
import 'package:day9/features/login/ui/login_screen.dart';
import 'package:day9/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : ConversationsScreen(),
    );
  }
}
