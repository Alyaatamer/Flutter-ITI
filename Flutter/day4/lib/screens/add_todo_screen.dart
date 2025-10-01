import 'package:day4/models/todo_model.dart';
import 'package:day4/providers/add_todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatelessWidget {
  final TodoModel? todo;
  final int? index;
  const AddTodoScreen({Key? key, this.todo, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTodoProvider>(
      create: (_) => AddTodoProvider()..fillData(todo),
      child: Consumer<AddTodoProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(todo != null ? 'Update Todo' : 'Add Todo'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: provider.titleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter todo title',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter todo title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: provider.descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Enter todo description',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter todo description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(provider.colors.length, (i) {
                          return GestureDetector(
                            onTap: () => provider.changeColor(i),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: CircleAvatar(
                                backgroundColor: provider.colors[i],
                                child: provider.selectedColor == i
                                    ? const Icon(Icons.check, color: Colors.white)
                                    : null,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 18),
                      ElevatedButton(
                        onPressed: () {
                          if (provider.formKey.currentState!.validate()) {
                            if (todo != null && index != null) {
                              provider.updateTodo(context, todo!, index!);
                            } else {
                              provider.addTodo(context);
                            }
                          }
                        },
                        child: Text(todo != null ? 'Update Todo' : 'Add Todo'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
