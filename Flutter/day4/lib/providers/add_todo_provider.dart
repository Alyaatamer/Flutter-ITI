import 'package:day4/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddTodoProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final List<Color> colors = [Colors.green, Colors.yellow, Colors.red];
  int selectedColor = 0;

  void fillData(TodoModel? todoModel) {
    if (todoModel != null) {
      titleController.text = todoModel.title;
      descriptionController.text = todoModel.description;
      selectedColor =
          colors.indexWhere((color) => color.value == todoModel.color);
      if (selectedColor == -1) selectedColor = 0;
      notifyListeners();
    } else {
      // reset
      titleController.clear();
      descriptionController.clear();
      selectedColor = 0;
      notifyListeners();
    }
  }

  Future<void> addTodo(BuildContext context) async {
    final box = await Hive.openBox<TodoModel>('todosBox');
    final todo = TodoModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      createdAt: DateTime.now().toIso8601String(),
      color: colors[selectedColor].value,
    );
    await box.add(todo);
    Navigator.pop(context, true);
  }

  Future<void> updateTodo(
      BuildContext context, TodoModel oldTodo, int index) async {
    final box = await Hive.openBox<TodoModel>('todosBox');
    final todoModel = TodoModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      createdAt: oldTodo.createdAt,
      color: colors[selectedColor].value,
      isCompleted: oldTodo.isCompleted,
    );
    await box.putAt(index, todoModel);
    Navigator.pop(context, true);
  }

  void changeColor(int index) {
    selectedColor = index;
    notifyListeners();
  }
}
