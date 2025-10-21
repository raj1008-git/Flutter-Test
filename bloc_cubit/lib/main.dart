import 'package:bloc_cubit/cubit/todo_cubit.dart';
import 'package:bloc_cubit/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {'/': (_) => TodoList(), '/add-todo': (_) => AddTodoPage()},
      ),
    );
  }
}
