import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/tasks/data/datasources/tasks_remote_datasource.dart';
import 'package:to_do/app/features/tasks/data/model/remote/request/tasks_request_dto.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksRemoteDatasource _remoteDatasource;

  TasksRepositoryImpl({
    required TasksRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, TasksData>> fetchTasksData({
    int limit = 0,
    int skip = 0,
  }) async {
    try {
      final result = await _remoteDatasource.fetchTasksData(
        data: TasksRequestDto(
          skip: skip,
          limit: limit,
        ),
      );

      return Right(
        result!,
      );
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
        ),
      );
    } on LocalException catch (exception) {
      return Left(
        LocalFailure(
          message: exception.message,
        ),
      );
    }
  }
}
