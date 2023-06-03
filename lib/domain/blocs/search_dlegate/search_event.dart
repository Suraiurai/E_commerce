part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class SearchTappedEvent extends SearchEvent {
  final String name;

  SearchTappedEvent(this.name);

   @override
  List<Object> get props => [name];

}