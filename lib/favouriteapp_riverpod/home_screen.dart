

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/favouriteapp_riverpod/provider/favourite_provider.dart';

class HomeScreenFavouriteApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'),
      actions: [
        PopupMenuButton<String>(onSelected: (value) {
          ref.read(favouriteProvider.notifier).favourite(value);
        },itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(value: 'All',child: Text('All')),
            const PopupMenuItem(value: 'Favourite',child: Text('Favourite')),
          ];
        })
      ],),
      body: Column(
        children: [

          TextField(
            decoration: InputDecoration(hintText: 'Search',
            border:OutlineInputBorder()),
            onChanged: (value){
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Expanded(child: ListView.builder(
            itemCount: favouriteList.filteredItems.length,
            itemBuilder: (context,index){
              final item = favouriteList.filteredItems[index];
              return ListTile(
                title:Text(item.name),
                trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_border),
              );
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(favouriteProvider.notifier).addItem();
      },
      child: const Icon(Icons.add),),
    );
  }
}