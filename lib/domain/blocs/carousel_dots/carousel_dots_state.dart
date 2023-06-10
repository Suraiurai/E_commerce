part of 'carousel_dots_bloc.dart';

abstract class CarouselDotsState extends Equatable {
  const CarouselDotsState(this.index);
  final int index;
  @override
  List<Object> get props => [index];
}

class CarouselDotsInitial extends CarouselDotsState {
  final int i;
  CarouselDotsInitial(this.i): super(i);
   @override
  List<Object> get props => [i];
}

class CarouselDotsChangedState extends CarouselDotsState {
  final int changed;
CarouselDotsChangedState(this.changed):super(changed);
  @override
  List<Object> get props => [changed];
}
