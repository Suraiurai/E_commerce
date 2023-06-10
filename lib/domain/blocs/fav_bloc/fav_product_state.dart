part of 'fav_product_bloc.dart';

abstract class FavProductChanged extends Equatable {
  FavProductChanged();
  @override
  List<Object> get props => [];
}

class FavListState extends FavProductChanged {
  final List favproducts;

  FavListState(this.favproducts);
  @override
  List<Object> get props => [favproducts];
}


