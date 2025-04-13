import 'package:bloc/bloc.dart';
import 'movie_rating_event.dart';
import 'movie_rating_state.dart';

class MovieRatingBloc extends Bloc<MovieRatingEvent, MovieRatingState> {
  final Future<double> Function(String movieId) getMovieRating;
  final Future<bool> Function(String movieId, double rating) submitMovieRating;

  MovieRatingBloc({
    required this.getMovieRating,
    required this.submitMovieRating,
  }) : super(MovieRatingInitial()) {
    on<LoadMovieRating>(_onLoadMovieRating);
    on<SubmitMovieRating>(_onSubmitMovieRating);
  }


  Future <void> _onLoadMovieRating(LoadMovieRating event, Emitter<MovieRatingState>emit)async{
    emit(MovieRatingLoading());
    try{
      final rating = await getMovieRating(event.movieId);
      emit(MovieRatingLoaded(currentRating: rating));
    }catch(e){
      emit(MovieRatingError(e.toString()));
    }
  }

  Future<void> _onSubmitMovieRating(SubmitMovieRating event, Emitter<MovieRatingState>emit)async{
    emit(MovieRatingLoading());
    try{
      final success = await submitMovieRating(event.movieId, event.rating);
      if(success){
        emit(MovieRatingLoaded(currentRating: event.rating, isRatingSubmitted: true));
      }else{
        emit (const MovieRatingError("Failed to submit rating"));
      }
    }catch(e){
      emit(MovieRatingError(e.toString()));
    }
  }
}
