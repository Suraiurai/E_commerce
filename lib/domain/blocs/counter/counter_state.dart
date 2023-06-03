part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState(this.number);
  final int number;
  @override
  List<Object> get props => [number];
}

class CounterInitial extends CounterState {
  CounterInitial(int intcount) : super(intcount);
}

class CounterChangedState extends CounterState {
  CounterChangedState(int count) : super(count);
}

class CounterOnTapState extends CounterState {
  CounterOnTapState(int id) : super(id);
}
