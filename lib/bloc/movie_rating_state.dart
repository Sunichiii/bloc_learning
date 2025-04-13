import 'package:equatable/equatable.dart';

abstract class MovieRatingState extends Equatable {
  const MovieRatingState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class MovieRatingInitial extends MovieRatingState {}

class MovieRatingLoading extends MovieRatingState {}

class MovieRatingLoaded extends MovieRatingState {
  final double currentRating;
  final bool isRatingSubmitted;

  const MovieRatingLoaded({
    required this.currentRating,
    this.isRatingSubmitted = false
  });

  @override
  // TODO: implement props
  List<Object?> get props => [currentRating, isRatingSubmitted];

  MovieRatingLoaded copyWith({
    double ? currentRating,
    bool ? isRatingSubmitted
  }) {
    return MovieRatingLoaded(currentRating: currentRating ?? this.currentRating,
        isRatingSubmitted: isRatingSubmitted ?? this.isRatingSubmitted);
  }
}


class MovieRatingError extends MovieRatingState{
  final String error;
  const MovieRatingError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}