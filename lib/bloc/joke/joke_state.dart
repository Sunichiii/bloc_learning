part of 'joke_bloc.dart';

class JokeState extends Equatable{
  final bool isLoading;
  final String joke;
  final String errorMessage;
  const JokeState({
    required this.errorMessage,
    required this.joke,
    required this.isLoading

});
  JokeState copyWith({
    bool? isLoading,
    String? joke,
    String? errorMessage,
}){
    return JokeState(errorMessage: '', joke: '', isLoading: false);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,errorMessage,joke];
}

