import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_example_api_app/providers/todo_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController _textEditingController = TextEditingController();
  bool? isCompleted = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("note name: "),
                TextField(
                  controller: _textEditingController,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("isComplete: "),
                Checkbox(
                  value: isCompleted,
                  onChanged: (value) {
                    setState(() {
                      isCompleted = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<TodoProvider>()
                      .createNewNote(_textEditingController.text, isCompleted);
                  GoRouter.of(context).pop();
                },
                child: Text("Add New Note"))
          ],
        ),
      ),
    );
  }
}
