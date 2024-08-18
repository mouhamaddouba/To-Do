import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do/app/core/di/di.dart';
import 'package:to_do/app/core/error/failures.dart';
import 'package:to_do/app/features/auth/domain/entities/login_data.dart';
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
      result.fold(
        (Failure failure) {
          emit(AuthLoadError(failure: failure));
        },
        (LoginData data) async {
          emit(AuthLoaded());
        },
      );
    });
  }
}
