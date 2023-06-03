part of 'bottom_nav_bloc.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState(this.index);
  final int index;
  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {
  final int initialindex;

  BottomNavInitial(this.initialindex): super(initialindex);
    @override
  List<Object> get props => [initialindex];
}
class BottomNavChangedState extends BottomNavState {
  final int changedindex;

  BottomNavChangedState(this.changedindex): super(changedindex);
      @override
  List<Object> get props => [changedindex];
}
