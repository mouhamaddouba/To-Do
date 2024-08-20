import 'package:dartz/dartz.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/use_case/use_case.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/repositories/tasks_repository.dart';

class AddTasksUseCase extends UseCase<SingleTaskData, AddTaskParams> {
  final TasksRepository _repository;

  AddTasksUseCase({
    required TasksRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, SingleTaskData>> call(AddTaskParams params) {
    return _repository.addTask(
      todo: params.todo,
      completed: params.completed,
      userId: params.userId
    );
  }
}

class AddTaskParams {
  final String todo;
  final bool completed;
  final int userId;

  AddTaskParams({
    required this.todo,
    required this.completed,
    required this.userId,
  });
}
