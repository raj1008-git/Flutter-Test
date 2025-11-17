import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasksEvent extends TaskEvent {
  const LoadTasksEvent();
}

class AddTaskEvent extends TaskEvent {
  final String title;
  final String description;

  const AddTaskEvent({required this.title, required this.description});
  @override
  List<Object?> get props => [title, description];
}

class ToggleTaskEvent extends TaskEvent {
  final String taskId;
  const ToggleTaskEvent(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

class TasksUpdatedEvent extends TaskEvent {
  final List<dynamic> tasks;

  const TasksUpdatedEvent(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
