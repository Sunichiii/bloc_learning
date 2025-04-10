import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'joke_event.dart';

part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeState(errorMessage: '', joke: '', isLoading: false)){
    on<FetchJokeEvent> (_onFetchJokeEvent);
  }

  Future <void> _onFetchJokeEvent(FetchJokeEvent event, Emitter<JokeState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await http.get(
        Uri.parse('https://official-joke-api.appspot.com/random_joke'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final joke = "${data['setup']} - ${data['punchline']}";
        emit(state.copyWith(isLoading: false, joke: joke, errorMessage: ''));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            joke: '',
            errorMessage: "Failed to load jokoe",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, joke: '', errorMessage: 'Error: $e'),
      );
    }
  }
}
