import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String createdAt;

  @HiveField(3)
  final int color;

  @HiveField(4)
  bool isCompleted;

  TodoModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.color,
    this.isCompleted = false,
  });
}
