import 'package:get_it/get_it.dart';
import 'package:to_do/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:to_do/app/features/auth/domain/repositories/auth_repository.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // Auth
  // Login RemoteDataSource instance
  instance.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());

  //Login Repository instance
  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: instance()));
}
