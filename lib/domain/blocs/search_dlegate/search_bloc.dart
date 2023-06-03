

import 'package:bloc/bloc.dart';
import 'package:e_commerce_flutter/domain/models/json/json_search.dart';
import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetPSearch getPSearch;
  SearchBloc(this.getPSearch) : super(SearchLoadingState()) {
    on<SearchTappedEvent>((event, emit) async{
      emit(SearchLoadingState());
      try {
        final products = await getPSearch.getsearch(event.name);
        
        emit(SearchLoadedState(jsonSearch: products,));
      } catch (e) {
        emit(SearchErroeState(e.toString()));
      }
    });
  }
}
