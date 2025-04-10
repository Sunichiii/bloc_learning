part of 'form_bloc.dart';

class FormState extends Equatable {
  final String name;
  final String email;
  final int age;
  final bool isValid;
  final String errorMessage;
  final bool isSubmitting;

  const FormState({
    required this.name,
    required this.email,
    required this.age,
    required this.isValid,
    required this.errorMessage,
    required this.isSubmitting,
  });

  FormState copyWith({
    String? name,
    String? email,
    int? age,
    bool? isValid,
    String? errorMessage,
    bool? isSubmitting,
  }) {
    return FormState(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object> get props => [name, email, age, isValid, errorMessage, isSubmitting];
}
