part of 'tasks_bloc.dart';

abstract class TasksState {
  const TasksState();
}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {}

class TasksError extends TasksState {}
