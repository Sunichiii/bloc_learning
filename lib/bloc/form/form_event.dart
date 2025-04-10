part of 'form_bloc.dart';

abstract class FormEvent extends Equatable{
  const FormEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NameChanged extends FormEvent{
  final String name;
  NameChanged(this.name);
  @override
  // TODO: implement props
  List<Object?> get props => [name];
}


class EmailChanged extends FormEvent{
  final String email;
  EmailChanged(this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class AgeChanged extends FormEvent{
  final String age;
  AgeChanged(this.age);

  @override
  // TODO: implement props
  List<Object?> get props => [age];
}


class SubmitForm extends FormEvent{}

