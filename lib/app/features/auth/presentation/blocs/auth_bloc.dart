import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/values/constant/app_settings.dart';
import 'package:to_do/app/core/di/di.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/core/storage/app_shared_prefrence.dart';
import 'package:to_do/app/core/storage/app_storage_keys.dart';
import 'package:to_do/app/features/auth/domain/entities/auth_data.dart';
import 'package:to_do/app/features/auth/domain/use_cases/login_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final LoginUseCase loginUseCase = instance<LoginUseCase>();
    on<Login>((event, emit) async {
      emit(AuthLoading());

      final result = await loginUseCase.call(
        Params(
          username: event.username,
          password: event.password,
        ),
      );

      await result.fold(
        (Failure failure) {
          emit(
            AuthLoadError(failure: failure),
          );
        },
        (AuthData data) async {
          AppSettings.user = data;
          AppSettings.token = data.token;
          await AppSharedPreferences().write(
            AppStorageKeys.token,
            data.token,
          );
          await AppSharedPreferences().write(
            AppStorageKeys.user,
            json.encode(
              data.toJson(),
            ),
          );
          emit(AuthLoaded());
        },
      );
    });
  }
}
