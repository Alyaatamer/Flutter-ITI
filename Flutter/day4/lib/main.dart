import 'package:day4/models/todo_model.dart';
import 'package:day4/providers/app_provider.dart';
import 'package:day4/providers/todos_provider.dart';
import 'package:day4/screens/todos_screen.dart';
import 'package:day4/style/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()..getIsDark()),
        ChangeNotifierProvider(create: (_) => TodosProvider()..getAllTodos()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: appProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const TodosScreen(),
        );
      },
    );
  }
}
