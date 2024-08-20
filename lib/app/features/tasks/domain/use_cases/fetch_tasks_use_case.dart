import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class FetchTasksUseCase extends UseCase<TasksData, FetchTasksParams> {
  final TasksRepository _repository;

  FetchTasksUseCase({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, TasksData>> call(FetchTasksParams params) {
    return _repository.fetchTasksData(
      limit: params.limit,
      skip: params.skip,
    );
  }
}

class FetchTasksParams {
  final int limit;
  final int skip;

  FetchTasksParams({
    this.limit = 0,
    this.skip = 0,
  });
}
