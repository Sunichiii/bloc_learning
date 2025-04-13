
import 'package:equatable/equatable.dart';


abstract class MovieRatingEvent extends Equatable {
  const MovieRatingEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadMovieRating extends MovieRatingEvent{
  final String movieId;

  const LoadMovieRating(this.movieId);
  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}


class SubmitMovieRating extends MovieRatingEvent{
  final String movieId;
  final double rating;

  const SubmitMovieRating(this.movieId, this.rating);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId, rating];
}
