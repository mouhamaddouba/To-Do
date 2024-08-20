import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class UpdateTaskUseCase extends UseCase<SingleTaskData, UpdateTaskParams> {
  final TasksRepository _repository;

  UpdateTaskUseCase({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, SingleTaskData>> call(UpdateTaskParams params) {
    return _repository.updateTask(
      id: params.todoId,
      completed: params.completed,
    );
  }
}

class UpdateTaskParams {
  final int todoId;
  final bool completed;

  UpdateTaskParams({
    required this.todoId,
    required this.completed,
  });
}
