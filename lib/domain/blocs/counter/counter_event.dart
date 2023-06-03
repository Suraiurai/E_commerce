part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}
class PlusEvent extends  CounterEvent{
  
}

class MinusEvent extends CounterEvent {
  
}

class OnTapEvent extends CounterEvent {
  final int id;

  OnTapEvent(this.id);
    @override
  List<Object> get props => [];
}