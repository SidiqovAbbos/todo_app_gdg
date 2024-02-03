import 'package:flutter/material.dart';
import 'package:todo_app_gdg/todo/models/todo_item.dart';
import 'package:todo_app_gdg/todo/widgets/card_statics.dart';

class StatisticsPage extends StatelessWidget {
  final List<ToDoItem> items;
  const StatisticsPage(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardStaticsWidget(
              iconData: Icons.format_align_left_sharp,
              number: items.length,
              iconColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CardStaticsWidget(
                    iconData: Icons.clear,
                    number: items.where((e) => !e.done).length,
                    iconColor: Colors.orange,
                  ),
                ),
                Expanded(
                  child: CardStaticsWidget(
                    iconData: Icons.check,
                    number: items.where((e) => e.done).length,
                    iconColor: Colors.green,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
