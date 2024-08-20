import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/values/constant/app_settings.dart';
import 'package:to_do/app/core/storage/app_shared_prefrence.dart';
import 'package:to_do/app/core/storage/app_storage_keys.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/features/auth/domain/entities/auth_data.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<FetchSplashScreenData>((event, emit) async {
      /// Delay before movement
      await Future.delayed(
        const Duration(
          milliseconds: AppConstants.duration1700,
        ),
      );

      /// Read token to check
      String? token = await AppSharedPreferences().read(
        AppStorageKeys.token,
      );
      AppSettings.token = token;
      if (token != null) {
        String? userModelString = await AppSharedPreferences().read(
          AppStorageKeys.user,
        );
        if (userModelString != null && userModelString.isNotEmpty) {
          AppSettings.user = AuthData.fromJson(
            json.decode(userModelString),
          );
        }
      }
      emit(
        SplashLoaded(token: token),
      );
    });
  }
}
