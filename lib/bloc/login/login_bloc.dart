import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(isLoading: false, isSuccess: false, errorMessage: ''));

  @override
  void <LoginSubmitted>(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    // Simulate API Call & Validation
    await Future.delayed(const Duration(seconds: 2));

    if (event?.password == 'password123') {
      emit(state.copyWith(isLoading: false, isSuccess: true, errorMessage: ''));
    } else {
      emit(state.copyWith(isLoading: false, isSuccess: false, errorMessage: 'Invalid credentials'));
    }
  }
}

extension on  {
  get password => null;
}
