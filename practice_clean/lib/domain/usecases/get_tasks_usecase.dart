import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository _repository;
  GetTasksUseCase(this._repository);

  Future<List<TaskEntity>> call() async {
    return await _repository.getAllTasks();
  }

  Stream<List<TaskEntity>> watch() {
    return _repository.watchTasks();
  }
}
