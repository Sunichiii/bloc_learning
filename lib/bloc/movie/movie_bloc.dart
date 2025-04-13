import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  Timer? _debounce;

  MovieSearchBloc() : super(const MovieSearchState(isLoading: false, movies: [], errorMessage: '')) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event,
      Emitter<MovieSearchState> emit,
      ) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(state.copyWith(isLoading: true));

      try {
        final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=${event.query}'));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final movies = data.map((movie) => movie['show']).toList();
          emit(state.copyWith(isLoading: false, movies: movies, errorMessage: ''));
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: 'Failed to fetch data.'));
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: 'Error: $e'));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}