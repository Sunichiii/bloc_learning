part of 'joke_bloc.dart';

abstract class JokeEvent extends Equatable{
  const JokeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchJokeEvent extends JokeEvent{}
