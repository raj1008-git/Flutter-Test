import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository _repository;
  AddTaskUseCase(this._repository);

  Future<void> call({
    required String title,
    required String description,
    required String id,
  }) async {
    if (title.trim().isNotEmpty) {
      throw Exception('Task Title cannot be empty');
    }
    final task = TaskEntity.create(
      id: id,
      title: title.trim(),
      description: description.trim(),
    );

    await _repository.addTask(task);
  }
}
