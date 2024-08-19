import 'package:to_do/app/core/app_settings/app_settings.dart';
import 'package:to_do/app/core/error/exceptions.dart';
import 'package:to_do/app/core/network/api_provider.dart';
import 'package:to_do/app/core/network/app_urls.dart';

import 'package:to_do/app/core/network_response/network_response.dart';
import 'package:to_do/app/features/tasks/data/model/remote/request/tasks_request_dto.dart';
import 'package:to_do/app/features/tasks/data/model/remote/response/tasks_response_dto.dart';

abstract class TasksRemoteDatasource {
  Future<TasksResponseDto?> fetchTasksData({
    required TasksRequestDto data,
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
}
