import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';

class TasksResponseDto extends TasksData {
  TasksResponseDto({
    required super.todos,
    required super.limit,
    required super.skip,
    required super.total,
  });

  factory TasksResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      TasksResponseDto(
        todos: (json['todos'] as List<dynamic>?)
                ?.map((e) => SingleTaskData.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
      );
}
