

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/riverpod/Item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref) {
  return ItemNotifier();
});

class  ItemNotifier extends StateNotifier<List<Item>> {
    ItemNotifier() : super([]);

    //For adding an item
    void addItem(String name) {
      final item = Item(id: DateTime.now().toString(), name: name);
      state.add(item);
      state = state.toList();
    }

    //For updating an item
    void updateItem(String id,String name) {
      int foundIndex = state.indexWhere((item) => item.id == id );
      state[foundIndex].name = name;
      state = state.toList();
    }

    //For deleting an item
    void deleteItem(String id) {
      state.removeWhere((item) => item.id == id);
      state = state.toList();
    }
}