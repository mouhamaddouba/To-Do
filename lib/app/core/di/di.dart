import 'package:get_it/get_it.dart';
import 'package:to_do/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:to_do/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:to_do/app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:to_do/app/features/tasks/data/datasources/tasks_remote_datasource.dart';
import 'package:to_do/app/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/fetch_tasks_use_case.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/update_task_use_case.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  /// Auth
  // Login RemoteDataSource instance
  instance.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());

  //Login Repository instance
  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: instance()));
  // Login UseCase instance
  instance.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: instance()));

  /// Tasks
  // Tasks RemoteDataSource instance
  instance.registerLazySingleton<TasksRemoteDatasource>(
      () => TasksRemoteDatasourceImpl());

  //Tasks Repository instance
  instance.registerLazySingleton<TasksRepository>(
      () => TasksRepositoryImpl(remoteDatasource: instance()));
  // Tasks Fetch Tasks UseCase instance
  instance.registerLazySingleton<FetchTasksUseCase>(
      () => FetchTasksUseCase(repository: instance()));
  // Tasks update Tasks UseCase instance
  instance.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(repository: instance()));
  // Tasks add Tasks UseCase instance
  instance.registerLazySingleton<AddTasksUseCase>(
      () => AddTasksUseCase(repository: instance()));
  // Tasks delete Tasks UseCase instance
  instance.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(repository: instance()));
}
