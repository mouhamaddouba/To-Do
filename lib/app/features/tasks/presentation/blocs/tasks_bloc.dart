import 'package:bloc/bloc.dart';
import 'package:to_do/app/core/di/di.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/fetch_tasks_use_case.dart';

import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/update_task_use_case.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    final FetchTasksUseCase fetchTasksUseCase = instance<FetchTasksUseCase>();
    final AddTasksUseCase addTaskUseCase = instance<AddTasksUseCase>();
    final UpdateTaskUseCase updateTasUseCase = instance<UpdateTaskUseCase>();
    final DeleteTaskUseCase deleteTasUseCase = instance<DeleteTaskUseCase>();
    on<FetchTaskEvent>((event, emit) async {
      emit(TasksLoading());

      final result = await fetchTasksUseCase.call(
        FetchTasksParams(
          limit: event.limit,
          skip: event.skip,
        ),
      );
      await result.fold(
        (Failure failure) {
          emit(TasksLoadError(failure: failure));
        },
        (TasksData data) async {
          emit(TasksLoaded(tasks: data));
        },
      );
    });

    on<AddNewTaskEvent>((event, emit) async {
      emit(TasksLoading());

      final result = await addTaskUseCase.call(
        AddTaskParams(
          completed: event.completed,
          todo: event.todo,
          userId: event.userId,
        ),
      );
      await result.fold(
        (Failure failure) {
          emit(TasksLoadError(failure: failure));
        },
        (SingleTaskData data) async {
          add(FetchTaskEvent());
        },
      );
    });

    on<UpdateTaskEvent>((event, emit) async {
      final result = await updateTasUseCase.call(
        UpdateTaskParams(
          completed: event.completed,
          todoId: event.todoId,
        ),
      );
      await result.fold(
        (Failure failure) {
          emit(TasksLoadError(failure: failure));
        },
        (SingleTaskData data) async {},
      );
    });

    on<DeleteTaskEvent>((event, emit) async {
      final result = await deleteTasUseCase.call(
        DeleteTaskParams(
          todoId: event.todoId,
        ),
      );
      await result.fold(
        (Failure failure) {
          emit(TasksLoadError(failure: failure));
        },
        (bool data) async {
          add(FetchTaskEvent());
        },
      );
    });
  }
}
