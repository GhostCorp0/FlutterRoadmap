
import '../model/Item.dart';

class FavouriteState {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;

  FavouriteState(
      {required this.allItems,
      required this.filteredItems,
      required this.search});

  FavouriteState copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
        allItems: allItems ?? this.allItems,
        filteredItems: filteredItems ?? this.filteredItems,
        search: search ?? this.search);
  }
}
