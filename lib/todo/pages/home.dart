import 'package:flutter/material.dart';
import 'package:todo_app_gdg/todo/models/todo_item.dart';
import 'package:todo_app_gdg/todo/models/todo_filter.dart';
import 'package:todo_app_gdg/todo/pages/statistics.dart';
import 'package:todo_app_gdg/todo/widgets/add_dialog.dart';
import 'package:todo_app_gdg/todo/widgets/todo_list.dart';

class HomePape extends StatefulWidget {
  const HomePape({super.key});

  @override
  State<HomePape> createState() => _HomePapeState();
}

class _HomePapeState extends State<HomePape> {
  final List<ToDoItem> itemSource = dummyItems;
  ToDoFilter currentFilter = ToDoFilter.All;

  List<ToDoItem> get filteredItems => switch (currentFilter) {
        ToDoFilter.Active => itemSource.where((e) => !e.done).toList(),
        ToDoFilter.Completed => itemSource.where((e) => e.done).toList(),
        _ => List.of(itemSource),
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List 📝'),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_list),
            itemBuilder: (BuildContext context) {
              return ToDoFilter.values.map(
                (ToDoFilter choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(
                      choice.name,
                      style: TextStyle(
                        color: choice == currentFilter
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        currentFilter = choice;
                      });
                    },
                  );
                },
              ).toList();
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => StatisticsPage(itemSource),
                  ),
                );
              },
              icon: const Icon(Icons.line_axis)),
        ],
      ),
      body: ToDoListWidget(
        filteredItems,
        onChecked: (ToDoItem item, bool checked) {
          setState(() {
            final index = itemSource.indexOf(item);
            itemSource[index] = ToDoItem(
                title: item.title,
                description: item.description,
                done: checked);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await showDialog<ToDoItem?>(
            context: context,
            builder: (ctc) => const AddDialogWidget(),
          );

          if (newItem != null) {
            setState(() {
              itemSource.add(newItem);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
