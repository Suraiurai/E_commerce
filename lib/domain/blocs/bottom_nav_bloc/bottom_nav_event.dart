part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavTappedEvent extends  BottomNavEvent{
  final int index;

  BottomNavTappedEvent(this.index);
    @override
  List<Object> get props => [index];
}
