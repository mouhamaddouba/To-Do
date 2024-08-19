import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class TasksUseCase extends UseCase<TasksData, Params> {
  final TasksRepository _repository;

  TasksUseCase({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, TasksData>> call(Params params) {
    return _repository.fetchTasksData(
      limit: params.limit,
      skip: params.skip,
    );
  }
}

class Params {
  final int limit;
  final int skip;

  Params({
    this.limit = 0,
    this.skip = 0,
  });
}
