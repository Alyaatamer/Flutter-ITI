import 'package:day4/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoModel> todos = [];

  Future<void> getAllTodos() async {
    final box = await Hive.openBox<TodoModel>('todosBox');
    todos = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    final box = await Hive.openBox<TodoModel>('todosBox');
    await box.deleteAt(index);
    await getAllTodos();
  }

  Future<void> changeTodoCompletion(int index, bool value) async {
    final box = await Hive.openBox<TodoModel>('todosBox');
    final todo = todos[index];
    todo.isCompleted = value;
    await box.putAt(index, todo);
    await getAllTodos();
  }
}
