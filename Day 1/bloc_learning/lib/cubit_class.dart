import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0); // initial state 0 banauncha

  void increment() => emit(state + 1);  //naya stae emit garne

  void decrement() => emit (state - 1);
}