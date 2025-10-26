import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String name;
  final DateTime createdAt;

  const Todo({required this.name, required this.createdAt});

  @override
  List<Object?> get props => [name, createdAt];

  @override
  String toString() => 'Todo(name: $name, createdAt: $createdAt)';
}