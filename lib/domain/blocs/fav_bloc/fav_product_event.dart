part of 'fav_product_bloc.dart';

abstract class FavProductEvent extends Equatable {
  const FavProductEvent();
  @override
  List<Object> get props => [];
}

class OnAddEvent extends FavProductEvent {
 final Product productadd;
  final int ida;
  OnAddEvent( {required this.ida,required this.productadd});
  @override
  List<Object> get props => [ ida, productadd];
}



class OnDeleteEvent extends FavProductEvent {

  final int idd;
  OnDeleteEvent(this.idd);
  @override
  List<Object> get props => [ idd];
}
