import 'package:isar/isar.dart';
import 'package:task_manager/core/database/database_service.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

import '../../domain/entities/task_entity.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Isar _isar;
  TaskRepositoryImpl(this._isar);

  factory TaskRepositoryImpl.create() {
    return TaskRepositoryImpl(DatabaseService.instance.database);
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    final taskModel = TaskModel.fromEntity(task);
    await _isar.writeTxn(() async {
      await _isar.taskModels.put(taskModel);
    });
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    final tasks = await _isar.taskModels
        .where()
        .sortByCreatedAtDesc()
        .findAll();
    return tasks.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final existingTask = await _isar.taskModels
        .filter()
        .taskIdEqualTo(task.id)
        .findFirst();
    if (existingTask == null) {
      throw Exception('task not found: ${task.id}');
    }
    existingTask.title = task.title;
    existingTask.description = task.description;
    existingTask.isCompleted = task.isCompleted;

    await _isar.writeTxn(() async {
      await _isar.taskModels.put(existingTask);
    });
  }

  @override
  Future<void> deleteTask(String id) async {
    final task = await _isar.taskModels.filter().taskIdEqualTo(id).findFirst();
    if (task != null) {
      await _isar.writeTxn(() async {
        await _isar.taskModels.delete(task.id);
      });
    }
  }

  @override
  Future<TaskEntity?> getTaskById(String id) async {
    final task = await _isar.taskModels.filter().taskIdEqualTo(id).findFirst();
    return task?.toEntity();
  }

  @override
  Stream<List<TaskEntity>> watchTasks() {
    return _isar.taskModels
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
