import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/presentation/bloc/task_event.dart';
import 'package:task_manager/presentation/bloc/task_state.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/get_tasks_usecase.dart';
import '../../domain/usecases/toggle_task_usecase.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUseCase _addTaskUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final ToggleTaskUseCase _toggleTaskUseCase;

  final Uuid _uuid;
  StreamSubscription? _tasksSubscription;

  TaskBloc({
    required AddTaskUseCase addTaskUseCase,
    required GetTasksUseCase getTasksUseCase,
    required ToggleTaskUseCase toggleTaskUseCase,
    Uuid? uuid,
  }) : _addTaskUseCase = addTaskUseCase,
       _getTasksUseCase = getTasksUseCase,
       _toggleTaskUseCase = toggleTaskUseCase,
       _uuid = uuid ?? Uuid(),
       super(const TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<TasksUpdatedEvent>(_onTasksUpdated);
    on<AddTaskEvent>(_onAddTask);
    on<ToggleTaskEvent>(_onToggleTask);
  }
  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());

    try {
      await _tasksSubscription?.cancel();
      _tasksSubscription = _getTasksUseCase.watch().listen(
        (tasks) {
          add(TasksUpdatedEvent(tasks));
        },
        onError: (error) {
          add(TasksUpdatedEvent([]));
        },
      );
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onTasksUpdated(
    TasksUpdatedEvent event,
    Emitter<TaskState> emit,
  ) async {
    final tasks = event.tasks.cast<TaskEntity>();
    emit(TaskLoaded(tasks));
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    try {
      final taskId = _uuid.v4();
      await _addTaskUseCase(
        id: taskId,
        title: event.title,
        description: event.description,
      );
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onToggleTask(
    ToggleTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _toggleTaskUseCase(event.taskId);
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
