


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/favouriteapp_riverpod/provider/favourite_states.dart';

import '../model/Item.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier,FavouriteState>((ref) {
  return FavouriteNotifier();
});


class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier() : super(FavouriteState(allItems:[], filteredItems: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: "Macbook", favourite: true, id: 1),
      Item(name: "iPhone", favourite: true, id: 1),
      Item(name: "G-Force 3060", favourite: false, id: 1),
      Item(name: "Samsung Ultra", favourite: true, id: 1),
      Item(name: "Google Pixel 9", favourite: false, id: 1),
      Item(name: "iPad Pro 13", favourite: true, id: 1),
    ];

    state = state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }
    void filterList(String search) {
      state = state.copyWith(filteredItems: _filterItems(state.allItems,search));
    }

    void favourite(String option) {
    state = state.copyWith(filteredItems: _favouriteItems(state.allItems,option));
    }

  List<Item> _favouriteItems(List<Item> items,String option) {
    if(option == 'All') {
      return items;
    }

    return items.
    where((item) =>
        item.favourite == true)
        .toList();
  }

    List<Item> _filterItems(List<Item> items,String search) {
      if(search.isEmpty) {
        return items;
      }
      return items.
      where((item) =>
      item.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
    }
  }
