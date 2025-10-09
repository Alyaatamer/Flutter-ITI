import 'package:day7/core/local_storage/shared_preferences_helper.dart';
import 'package:day7/core/networking/dio_factory.dart';
import 'package:day7/core/style/app_themes.dart';
import 'package:day7/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioFactory.init();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}
