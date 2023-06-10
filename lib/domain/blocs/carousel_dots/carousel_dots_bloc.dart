import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'carousel_dots_event.dart';
part 'carousel_dots_state.dart';

class CarouselDotsBloc extends Bloc<CarouselDotsEvent, CarouselDotsState> {
  CarouselDotsBloc() : super(CarouselDotsInitial(0)) {
    on<OnChangeEvent>((event, emit) {
      emit(CarouselDotsChangedState(event.index));
    });
  }
}
