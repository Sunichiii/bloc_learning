import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc()
    : super(
        const FormState(
          name: '',
          email: '',
          age: 0,
          isValid: false,
          errorMessage: '',
          isSubmitting: false,
        ),
      ) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<AgeChanged>(_onAgeChanged);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onNameChanged(NameChanged event, Emitter<FormState> emit) {
    final isValid = _validateForm(event.name, state.email, state.age);
    emit(state.copyWith(name: event.name, isValid: isValid, errorMessage: ''));
  }

  void _onEmailChanged(EmailChanged event, Emitter<FormState> emit) {
    final isValid = _validateForm(state.name, event.email, state.age);
    emit(
      state.copyWith(email: event.email, isValid: isValid, errorMessage: ''),
    );
  }

  void _onAgeChanged(AgeChanged event, Emitter<FormState> emit) {
    final int? age = int.tryParse(
      event.age,
    ); // Convert String to int, returns null if invalid
    if (age != null && age >= 18) {
      final isValid = _validateForm(state.name, state.email, age);
      emit(state.copyWith(age: age, isValid: isValid, errorMessage: ''));
    } else {
      emit(
        state.copyWith(
          errorMessage: 'Age must be a number greater than or equal to 18.',
        ),
      );
    }
  }

  void _onSubmitForm(SubmitForm event, Emitter<FormState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(isSubmitting: true));

      //simulate form submission
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(errorMessage: "Form is invalid"));
    }
  }

  bool _validateForm(String name, String email, int age) {
    final isNameValid = name.isNotEmpty;
    final isEmailValid = email.contains('@');
    final isAgeValid = age > 18;

    return isNameValid && isEmailValid && isAgeValid;
  }
}
