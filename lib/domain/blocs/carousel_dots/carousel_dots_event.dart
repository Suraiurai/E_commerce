part of 'carousel_dots_bloc.dart';

abstract class CarouselDotsEvent extends Equatable {
  const CarouselDotsEvent();

  @override
  List<Object> get props => [];
}
class OnChangeEvent extends  CarouselDotsEvent{
  final int index;

  OnChangeEvent(this.index);
    @override
  List<Object> get props => [index];
}