import '../repositories/task_repository.dart';

class ToggleTaskUseCase {
  final TaskRepository _repository;

  ToggleTaskUseCase(this._repository);

  Future<void> call(String taskId) async {
    final task = await _repository.getTaskById(taskId);

    if (task == null) {
      throw Exception('Task not found: $taskId');
    }
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await _repository.updateTask(updatedTask);
  }
}
