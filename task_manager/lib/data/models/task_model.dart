import 'package:isar/isar.dart';

import '../../domain/entities/task_entity.dart';

part 'task_model.g.dart';

@collection
class TaskModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String taskId;
  late String title;
  late String description;
  late bool isCompleted;
  late DateTime createdAt;
  TaskModel();
  TaskEntity toEntity() {
    return TaskEntity(
      id: taskId,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel()
      ..taskId = entity.id
      ..title = entity.title
      ..description = entity.description
      ..isCompleted = entity.isCompleted
      ..createdAt = entity.createdAt;
  }
}
