import 'package:get_it/get_it.dart';
import 'package:task_manager/data/repositories/task_repository_impl.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';
import 'package:task_manager/domain/usecases/add_task_usecase.dart';
import 'package:task_manager/domain/usecases/get_tasks_usecase.dart';
import 'package:task_manager/domain/usecases/toggle_task_usecase.dart';
import 'package:task_manager/presentation/bloc/task_bloc.dart';

import '../database/database_service.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  await DatabaseService.instance.initialize();

  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl.create(),
  );

  getIt.registerFactory(() => AddTaskUseCase(getIt<TaskRepository>()));
  getIt.registerFactory(() => GetTasksUseCase(getIt<TaskRepository>()));
  getIt.registerFactory(() => ToggleTaskUseCase(getIt<TaskRepository>()));

  getIt.registerFactory(
    () => TaskBloc(
      addTaskUseCase: getIt<AddTaskUseCase>(),
      getTasksUseCase: getIt<GetTasksUseCase>(),
      toggleTaskUseCase: getIt<ToggleTaskUseCase>(),
    ),
  );
}
