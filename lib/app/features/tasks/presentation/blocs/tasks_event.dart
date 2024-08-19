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

class EditTaskEvent extends TasksEvent {
  EditTaskEvent();
}

class DeleteTaskEvent extends TasksEvent {
  DeleteTaskEvent();
}

class AddNewTaskEvent extends TasksEvent {
  AddNewTaskEvent();
}
