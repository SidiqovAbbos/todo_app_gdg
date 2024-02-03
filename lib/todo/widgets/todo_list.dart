import 'package:flutter/material.dart';
import 'package:todo_app_gdg/todo/models/todo_item.dart';

class ToDoListWidget extends StatelessWidget {
  final List<ToDoItem> items;
  final void Function(ToDoItem item, bool checked) onChecked;

  const ToDoListWidget(this.items, {super.key, required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: CheckboxListTile(
            key: Key(index.toString()),
            value: item.done,
            onChanged: (checked) => onChecked(item, checked!),
            subtitle: item.description == null ? null : Text(item.description!),
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
