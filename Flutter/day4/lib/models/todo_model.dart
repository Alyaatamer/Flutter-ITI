import 'package:hive/hive.dart';
part 'todo_model.g.dart';


@HiveType(typeId: 0)
class TodoModel extends HiveObject {
    @HiveField(0)
    final String title;
    @HiveField(1)
    final String description;
    @HiveField(2)
    final String CreateAt;
    @HiveField(3)
    final int Color;
    @HiveField(4)
    bool iscompleted;

  TodoModel({
      required this.title, 
      required this.description, 
      required this.CreateAt, 
      required this.Color,
      this.iscompleted = false
    });

}
