part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
   @override
  List<Object> get props => [];
}
class SearchLoadedState extends SearchState {
  final JsonSearch jsonSearch;
  
  SearchLoadedState({required this.jsonSearch});
   @override
  List<Object> get props => [jsonSearch,];
}
class SearchErroeState extends SearchState {
  final String error;

  SearchErroeState(this.error);
   @override
  List<Object> get props => [error];
}
