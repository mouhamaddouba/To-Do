part of 'tasks_bloc.dart';

abstract class TasksState {
  const TasksState();
}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final TasksData tasks;
  TasksLoaded({required this.tasks});
}

class TasksLoadError extends TasksState {
  final Failure failure;
  TasksLoadError({required this.failure});
}
