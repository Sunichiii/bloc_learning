part of 'movie_bloc.dart';

class MovieSearchState extends Equatable{
  final bool isLoading;
  final List<dynamic> movies;
  final String errorMessage;

  const MovieSearchState({
    required this.isLoading,
    required this.movies,
    required this.errorMessage,
});

  MovieSearchState copyWith({
    bool? isLoading,
    List<dynamic>? movies,
    String ? errorMessage,
}){
    return MovieSearchState(
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,movies, errorMessage];
}
