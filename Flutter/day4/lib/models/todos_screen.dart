import 'package:day4/add_todo_screen.dart';
import 'package:day4/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({ Key? key }) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<TodoModel> todos = [];
  void getalltodos() async{
       final box = await Hive.openBox<TodoModel>('todosbox');
       setState(() {
         todos = box.values.toList();
       });
  }

  void deleteBox (int index) async{
    final box = await Hive.openBox<TodoModel>('todosbox');
    await box.deleteAt(index);
    getalltodos();
  }

  void changetodocompletion(int index , bool value) async {
      final box = await Hive.openBox<TodoModel>('todosbox');
      final todo = todos[index];
      todo.iscompleted = value;
     await box.putAt(index, todo);
      getalltodos();
  }

  @override
  void initState() {
    super.initState();
    getalltodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
              'ToDos',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddToDoScreen()));
            if (result && result != null){
              getalltodos();
            }
          },
          child: Icon(Icons.add),
         ),
         body: ListView.separated(
          padding: EdgeInsets.all(16),
            itemBuilder: (context , index ){
              final todo = todos[index];
              return Container(
                padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(todo.Color),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      Checkbox(value: todo.iscompleted, onChanged: (value) {
                        changetodocompletion(index, value ?? false);
                      }),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              todo.description.trim(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {
                          deleteBox(index);
                      }, icon: Icon(Icons.delete , color: Colors.black,)),
                    ],
                  ),
              );
            } ,
            separatorBuilder: (context ,index) => SizedBox(height: 10),
            itemCount: todos.length,
            
         ),

    );
  }
}