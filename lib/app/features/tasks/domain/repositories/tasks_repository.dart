import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/tasks/data/model/remote/request/mange_task_request_dto.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';

abstract class TasksRepository {
  Future<Either<Failure, TasksData>> fetchTasksData({
    int limit = 0,
    int skip = 0,
  });
  Future<Either<Failure, SingleTaskData>> updateTask({
    required bool completed,
    required int id,
  });
  Future<Either<Failure, SingleTaskData>> addTask({
    required MangeTaskRequestDto todo,
  });
  Future<Either<Failure, bool>> deleteTask({
    required int id,
  });
}
