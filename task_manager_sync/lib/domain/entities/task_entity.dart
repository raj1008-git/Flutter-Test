import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  final bool isSynced;
  final bool needsSync;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
    this.isSynced = false,
    this.needsSync = false,
  });

  factory TaskEntity.create({
    required String id,
    required String title,
    required String description,
  }) {
    final now = DateTime.now();
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: false,
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
      isSynced: false,
      needsSync: true,
    );
  }

  TaskEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    bool? isSynced,
    bool? needsSync,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isCompleted: isCompleted ?? this.isCompleted,
      isDeleted: isDeleted ?? this.isDeleted,
      isSynced: isSynced ?? this.isSynced,
      needsSync: needsSync ?? this.needsSync,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    createdAt,
    updatedAt,
    isDeleted,
    isSynced,
    needsSync,
  ];
}
