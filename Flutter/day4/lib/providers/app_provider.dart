import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  bool isDark = false;

  Future<void> getIsDark() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  Future<void> toggleIsDark() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = !isDark;
    await prefs.setBool('isDark', isDark);
    notifyListeners();
  }
}
