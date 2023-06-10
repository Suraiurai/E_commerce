import 'package:bloc/bloc.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'addtobox_event.dart';
part 'addtobox_state.dart';

var box = Hive.box('products');

class AddtoboxBloc extends Bloc<AddtoboxEvent, AddtoboxState> {
  AddtoboxBloc() : super(BoxInitial(box.values.toList())) {
    on<OnAddtoBoxEvent>((event, emit) async {
      await box.put('product${event.id}', event.product);
      emit(BoxAddedState(box.values.toList()));
    });

    on<OnRemoveEvent>((event, emit) async {
      await box.delete('product${event.id}');
      emit(BoxAddedState(box.values.toList()));
    });
  }
}
