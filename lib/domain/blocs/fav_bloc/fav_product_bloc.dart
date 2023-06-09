import 'package:bloc/bloc.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'fav_product_event.dart';
part 'fav_product_state.dart';
  var box = Hive.box('fav_product');
class FavProductBloc extends Bloc<FavProductEvent, FavProductChanged> {
  FavProductBloc() : super(FavListState(box.values.toList())) {
  
 
    on<OnAddEvent>((event, emit) async {

      if (box.containsKey('fav${event.ida}') == false) {
        await box.put('fav${event.ida}', event.productadd);
     
       emit(FavListState([event.productadd,event.ida],));
      }
       
    });

    on<OnDeleteEvent>((event, emit) async {
      if (box.containsKey('fav${event.idd}') == true) {
      await box.delete('fav${event.idd}');
        emit(FavListState(box.values.toList()));
      }
    });
  }
}
