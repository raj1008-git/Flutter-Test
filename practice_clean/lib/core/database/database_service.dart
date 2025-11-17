import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/task_model.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Isar? _isar;

  DatabaseService._();

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  Future<void> initialize() async {
    if (_isar != null) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TaskModelSchema],
      directory: dir.path,
      name: 'task_manager_db',
    );
  }

  Isar get database {
    if (_isar == null) {
      throw Exception('Database Not Initialized. Call Initialize first.');
    }
    return _isar!;
  }

  Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
