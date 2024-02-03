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
  late final List<ToDoItem> items = dummyItems;
  ToDoFilter currentFilter = ToDoFilter.All;
  List<ToDoItem> get filteredItems => switch (currentFilter) {
        ToDoFilter.Active => items.where((e) => !e.done).toList(),
        ToDoFilter.Completed => items.where((e) => e.done).toList(),
        _ => List.of(items),
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List 📝'),
        centerTitle: false,
        actions: [
          PopupMenuButton<ToDoFilter>(
            icon: const Icon(Icons.filter_list),
            onSelected: (str) {},
            itemBuilder: (BuildContext context) {
              return ToDoFilter.values.map(
                (ToDoFilter choice) {
                  return PopupMenuItem<ToDoFilter>(
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
                    builder: (ctx) => StatisticsPage(items),
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
            final index = items.indexOf(item);
            items[index] = ToDoItem(
                title: item.title,
                description: item.description,
                done: checked);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<ToDoItem?>(
            context: context,
            builder: (ctc) => const AddDialogWidget(),
          );
          if (result != null) {
            setState(() {
              items.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
