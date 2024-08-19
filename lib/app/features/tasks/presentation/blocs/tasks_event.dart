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
  FetchTaskEvent();
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
