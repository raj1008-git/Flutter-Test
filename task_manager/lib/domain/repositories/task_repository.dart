import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskEntity task);
  Future<List<TaskEntity>> getAllTasks();
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
  Future<TaskEntity?> getTaskById(String id);
  Stream<List<TaskEntity>> watchTasks();
}
