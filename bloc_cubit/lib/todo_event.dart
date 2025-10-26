import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String title;

  const AddTodoEvent(this.title);

  @override
  List<Object?> get props => [title];
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  const DeleteTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent();
}