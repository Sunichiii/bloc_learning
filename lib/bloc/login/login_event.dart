part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoginSubmitted extends LoginEvent{
  final String email;
  final String password;

  const LoginSubmitted({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}