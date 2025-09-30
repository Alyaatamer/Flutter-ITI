import 'package:day4/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreen();
}

class _AddToDoScreen extends State<AddToDoScreen> {

  final TitleController = TextEditingController();  
  final Descriptioncontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final List<Color> colors = 
  [
      Colors.green ,
      Colors.yellow ,
      Colors.red
  ];
  int selectescolor = 0;

  void addtodo() async {
    final box = await Hive.openBox<TodoModel>('todosbox');
    final todo = TodoModel(
      title: TitleController.text,
      description: Descriptioncontroller.text,
      CreateAt: DateTime.now().toString(), 
      Color: colors[selectescolor].value) ;
    await box.add(todo);

    Navigator.pop(context , true);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Add ToDo',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formkey,
              child: Column(
                  children: [
                      TextFormField(
                          controller: TitleController,
                          decoration: InputDecoration(
                              hintText: 'Enter ToDo Title',
                              border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value == null || value.isEmpty){
                                return 'Enter ToDo Title';
                            }
                            return null;
                          },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: Descriptioncontroller,
                          decoration: InputDecoration(
                              hintText: 'Enter ToDo description',
                              border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          validator: (value){
                            if(value == null || value.isEmpty){
                                return 'Enter ToDo description';
                            }
                            return null;
                          },
                      ),
                      SizedBox(height: 10),
                      Row(
                          spacing: 5,
                          children: List.generate(colors.length, (index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectescolor = index;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: colors[index], child: selectescolor == index ? Icon(Icons.check , color: Colors.white) : null,
                               ),
                            );
                          }),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: (){
                            if(formkey.currentState!.validate()){
                               addtodo();
                            }
                       }, 
                       style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                       ),
                       child: Text(
                        'Add ToDo',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                     )),
                  ],
              ),
            ),
          ),
        ),
    );
  }
}