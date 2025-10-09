import 'package:day7/core/local_storage/shared_preferences_helper.dart';
import 'package:day7/features/home/ui/home_screen.dart';
import 'package:day7/features/on_boaring/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() async {
    await Future.delayed(Duration(seconds: 2));
    final token = SharedPreferencesHelper.getString('token');
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/splash_bg.png'),
            Image.asset('assets/images/splash_logo.png'),
          ],
        ),
      ),
    );
  }
}
