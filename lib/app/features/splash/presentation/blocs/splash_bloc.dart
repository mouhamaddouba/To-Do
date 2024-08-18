import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do/app/core/app_settings/app_settings.dart';
import 'package:to_do/app/core/storage/app_shared_prefrence.dart';
import 'package:to_do/app/core/storage/app_storage_keys.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<FetchSplashScreenData>((event, emit) async {
      await Future.delayed(const Duration(seconds: AppConstants.duration15));
      String? token = await AppSharedPreferences().read(AppStorageKeys.token);
      AppSettings.token = token;
      emit(SplashLoaded(token: token));
    });
  }
}
