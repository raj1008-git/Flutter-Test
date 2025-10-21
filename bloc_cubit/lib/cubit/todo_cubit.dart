import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title Cannot be Empty');
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());

    // Create a new list with the old todos and add the new one
    final updatedList = [...state, todo];

    emit(updatedList);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
