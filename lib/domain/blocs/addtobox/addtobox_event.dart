part of 'addtobox_bloc.dart';

abstract class AddtoboxEvent extends Equatable {
  const AddtoboxEvent();

  @override
  List<Object> get props => [];
}

class OnAddtoBoxEvent extends AddtoboxEvent {
  final Product product;
  final int id;
  OnAddtoBoxEvent({required this.product, required this.id});
  @override
  List<Object> get props => [product, id];
}

class OnRemoveEvent extends AddtoboxEvent {
  final int id;
  OnRemoveEvent(this.id);
  @override
  List<Object> get props => [id];
}
