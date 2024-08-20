import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';

class TasksData {
  final List<SingleTaskData> todos;
  final int total;
  final int skip;
  final int limit;

  TasksData({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TasksData.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      TasksData(
        todos: (encodedData['todos'] as List<dynamic>?)
                ?.map(
                  (e) => SingleTaskData.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
        total: encodedData['total'],
        skip: encodedData['skip'],
        limit: encodedData['limit'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'todos': todos
            .map(
              (element) => element.toJson(),
            )
            .toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
