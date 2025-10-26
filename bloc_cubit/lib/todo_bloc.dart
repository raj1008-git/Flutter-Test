import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodosEvent event, Emitter<TodoState> emit) {
    emit(const TodoLoaded([]));
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    if (event.title.isEmpty) {
      emit(const TodoError('Title Cannot be Empty'));
      // Return to previous state after showing error
      if (state is TodoLoaded) {
        emit(state);
      }
      return;
    }

    final currentState = state;
    if (currentState is TodoLoaded) {
      final todo = Todo(name: event.title, createdAt: DateTime.now());
      final updatedList = [...currentState.todos, todo];
      emit(TodoLoaded(updatedList));
    }
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) {
    final currentState = state;
    if (currentState is TodoLoaded) {
      final updatedList = List<Todo>.from(currentState.todos)
        ..removeAt(event.index);
      emit(TodoLoaded(updatedList));
    }
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: $error');
  }
}