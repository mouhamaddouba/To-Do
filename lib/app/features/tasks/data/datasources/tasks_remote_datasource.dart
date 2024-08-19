import 'package:to_do/app/core/app_settings/app_settings.dart';
import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/network/api_provider.dart';
import 'package:to_do/app/core/network/app_urls.dart';

import 'package:to_do/app/core/network_response/network_response.dart';
import 'package:to_do/app/features/tasks/data/model/remote/request/mange_task_request_dto.dart';
import 'package:to_do/app/features/tasks/data/model/remote/request/tasks_request_dto.dart';
import 'package:to_do/app/features/tasks/data/model/remote/response/tasks_response_dto.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';

abstract class TasksRemoteDatasource {
  Future<TasksResponseDto?> fetchTasksData({
    required TasksRequestDto data,
  });

  Future<SingleTaskData?> addTask({
    required MangeTaskRequestDto newTask,
  });

  Future<SingleTaskData?> updateTask({
    required bool completed,
    required int id,
  });

  Future<bool> deleteTask({
    required int id,
  });
}

class TasksRemoteDatasourceImpl implements TasksRemoteDatasource {
  @override
  Future<TasksResponseDto?> fetchTasksData({
    required TasksRequestDto data,
  }) async {
    TasksResponseDto? result;

    await ApiProvider.get(
      token: AppSettings.token ?? '',
      url: AppUrls.tasks + AppSettings.user.id.toString(),
      queryParameters: data.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<TasksResponseDto>(
          data,
          TasksResponseDto.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }

  @override
  Future<SingleTaskData?> addTask(
      {required MangeTaskRequestDto newTask}) async {
    SingleTaskData? result;

    await ApiProvider.post(
      token: AppSettings.token ?? '',
      url: AppUrls.addTasks,
      data: newTask.toJson(),
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<SingleTaskData>(
          data,
          SingleTaskData.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }

  @override
  Future<bool> deleteTask({required int id}) async {
    await ApiProvider.delete(
      token: AppSettings.token ?? '',
      url: AppUrls.updateTasks + id.toString(),
      onSuccess: (dynamic data) {
        // final networkResponse = NetworkResponse.fromJson<SingleTaskData>(
        //   data,
        //   SingleTaskData.fromJson,
        // );
        //
        // if (!networkResponse.succeeded) {
        //   throw ServerException(
        //     message: networkResponse.message,
        //   );
        // }
        //
        // result = networkResponse.data;
        return true;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return true;
  }

  @override
  Future<SingleTaskData?> updateTask({
    required bool completed,
    required int id,
  }) async {
    SingleTaskData? result;

    await ApiProvider.put(
      token: AppSettings.token ?? '',
      url: AppUrls.updateTasks + id.toString(),
      data: {"completed": completed},
      onSuccess: (dynamic data) {
        final networkResponse = NetworkResponse.fromJson<SingleTaskData>(
          data,
          SingleTaskData.fromJson,
        );

        if (!networkResponse.succeeded) {
          throw ServerException(
            message: networkResponse.message,
          );
        }

        result = networkResponse.data;
      },
      onError: (String errorMessage) {
        throw ServerException(
          message: errorMessage,
        );
      },
    );

    return result;
  }
}
