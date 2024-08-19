import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do/app/core/di/di.dart';
import 'package:to_do/app/features/tasks/domain/entities/tasks_data.dart';
import 'package:to_do/app/features/tasks/domain/use_cases/tasks_use_case.dart';

import 'package:to_do/app/core/error/failures.dart';


part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    final TasksUseCase tasksUseCase = instance<TasksUseCase>();
    on<FetchTaskEvent>((event, emit) async {
      emit(TasksLoading());

      final result = await tasksUseCase.call(
        Params(
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
  }
}
