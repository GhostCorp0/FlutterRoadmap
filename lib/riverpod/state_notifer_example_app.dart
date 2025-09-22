import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/riverpod/item_provider.dart';

class StateNotifierExampleApp extends ConsumerWidget {
  const StateNotifierExampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier'),
      ),
      body: item.isEmpty
          ? Center(child: Text("No Dat a Found"))
          : ListView.builder(
        itemCount: item.length,
          itemBuilder: (context, index) {
              final itemDetail = item[index];
              return ListTile(
                title: Text(itemDetail.name), 
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      ref.read(itemProvider.notifier).updateItem(itemDetail.id,"AMAN SINGH");
                    }, icon: const Icon(Icons.edit)),

                    IconButton(onPressed: () {
                      ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
                    }, icon: const Icon(Icons.delete))
                  ],
                ),
              );
            }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("New Item");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
