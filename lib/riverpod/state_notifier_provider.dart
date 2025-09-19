import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '',isChange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChange(bool isChange){
    state = state.copyWith(isChange: isChange);
  }
}

class SearchState {
  final String search;
  final bool isChange;

  SearchState({required this.search, required this.isChange});

  SearchState copyWith({String? search, bool? isChange}) {
    return SearchState(search: search ?? this.search,
    isChange: isChange ?? this.isChange);
  }
}


