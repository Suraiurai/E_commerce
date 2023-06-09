part of 'addtobox_bloc.dart';

abstract class AddtoboxState extends Equatable {
  const AddtoboxState();

  @override
  List<Object> get props => [];
}

class BoxInitial extends AddtoboxState {
  final List listinit;
  BoxInitial(this.listinit);
  @override
  List<Object> get props => [listinit];
}

class BoxAddedState extends AddtoboxState {
  final List lst;
  BoxAddedState(this.lst);
  @override
  List<Object> get props => [lst];
}
