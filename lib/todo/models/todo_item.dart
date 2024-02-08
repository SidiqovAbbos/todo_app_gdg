// ignore_for_file: prefer_const_constructors

class ToDoItem {
  final String title;
  final String? description;
  final bool done;

  const ToDoItem({
    required this.title,
    this.description,
    this.done = false,
  });
}

List<ToDoItem> dummyItems = [
  ToDoItem(title: 'Item 1'),
  ToDoItem(title: 'Item 2', description: 'Some description'),
  ToDoItem(title: 'Item 3', done: true),
];
