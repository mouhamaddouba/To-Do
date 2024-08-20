part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class SortTaskEvent extends TasksEvent {
  final int sortOption;

  SortTaskEvent({
    required this.sortOption,
  });
}

class SearchTaskEvent extends TasksEvent {
  final String keywords;

  SearchTaskEvent({
    required this.keywords,
  });
}

class FetchTaskEvent extends TasksEvent {
  final int limit;

  final int skip;

  FetchTaskEvent({
    this.skip = 0,
    this.limit = 0,
  });
}

class UpdateTaskEvent extends TasksEvent {
  final int todoId;
  final bool completed;

  UpdateTaskEvent({required this.todoId, required this.completed});
}

class DeleteTaskEvent extends TasksEvent {
  final int todoId;

  DeleteTaskEvent({
    required this.todoId,
  });
}

class AddNewTaskEvent extends TasksEvent {
  final String todo;
  final bool completed;
  final int userId;

  AddNewTaskEvent({
    required this.todo,
    required this.userId,
    required this.completed,
  });
}
