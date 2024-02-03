import 'package:flutter/material.dart';
import 'package:todo_app_gdg/todo/pages/home.dart';

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        useMaterial3: false,
      ),
      home: const HomePape(),
    );
  }
}
