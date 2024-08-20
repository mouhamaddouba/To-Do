import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';

class SingleTaskResponseDto extends SingleTaskData {
  SingleTaskResponseDto({
    required super.id,
    required super.userId,
    required super.todo,
    required super.completed,
  });

  factory SingleTaskResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      SingleTaskResponseDto(
        id: json['id'],
        userId: json['userId'],
        todo: json['todo'],
        completed: json['completed'],
      );
}
