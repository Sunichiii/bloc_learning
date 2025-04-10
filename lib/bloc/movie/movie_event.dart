part of 'movie_bloc.dart';

abstract class MovieSearchEvent extends Equatable{
  const MovieSearchEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchQueryChanged extends MovieSearchEvent{
  final String query;
  const SearchQueryChanged(this.query);

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
