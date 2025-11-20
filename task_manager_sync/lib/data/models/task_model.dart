import 'package:hive/hive.dart';

import '../../domain/entities/task_entity.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late bool isCompleted;

  @HiveField(4)
  late DateTime createdAt;

  @HiveField(5)
  late DateTime updatedAt;
  @HiveField(6)
  late bool isDeleted;
  @HiveField(7)
  late bool isSynced;
  @HiveField(8)
  late bool needsSync;
  TaskModel();

  TaskModel.create({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.isSynced,
    required this.needsSync,
  });
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isDeleted: isDeleted,
      isSynced: isSynced,
      needsSync: needsSync,
    );
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel.create(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      isDeleted: entity.isDeleted,
      isSynced: entity.isSynced,
      needsSync: entity.needsSync,
    );
  }
}
