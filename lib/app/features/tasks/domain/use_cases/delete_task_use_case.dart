import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class DeleteTaskUseCase extends UseCase<bool, DeleteTaskParams> {
  final TasksRepository _repository;

  DeleteTaskUseCase({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) {
    return _repository.deleteTask(
      id: params.todoId,
    );
  }
}

class DeleteTaskParams {
  final int todoId;

  DeleteTaskParams({
    required this.todoId,
  });
}
