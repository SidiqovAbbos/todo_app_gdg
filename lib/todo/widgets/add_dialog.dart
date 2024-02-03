import 'package:flutter/material.dart';
import 'package:todo_app_gdg/todo/models/todo_item.dart';

class AddDialogWidget extends StatefulWidget {
  const AddDialogWidget({super.key});

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  bool hasTitle = false; // Needs to enable/disable of the 'Add' button

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new item"),
      content: IntrinsicHeight(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onChanged: (value) {
                setState(() {
                  hasTitle = value.isNotEmpty;
                });
              },
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Description',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: hasTitle
              ? () {
                  Navigator.pop(
                    context,
                    ToDoItem(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );
                }
              : null,
          child: const Text('Add'),
        )
      ],
    );
  }
}
