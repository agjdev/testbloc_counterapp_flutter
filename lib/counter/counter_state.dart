part of 'counter_bloc.dart';


class CounterState {
  final int count;

  CounterState(this.count);
}

class InitialState extends CounterState {
  InitialState() : super(0);
}
