part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ToggleThemeEvent extends ThemeEvent{}



