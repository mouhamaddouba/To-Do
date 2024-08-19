import 'package:dartz/dartz.dart';

import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';

abstract class TasksRepository {
  Future<Either<Failure, TasksData>> fetchTasksData({
    int limit = 0,
    int skip = 0,
  });
}
