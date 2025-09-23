import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/stream_provider/stream_provider.dart';

class HomeScreenStreamProvider extends ConsumerWidget {
  const HomeScreenStreamProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Future Stream Provider')),
      ),
      body: Consumer(builder: (context,ref,child) {
        final provider = ref.watch(stockPriceProvider);
        return Center(
          child: provider.when(
              skipLoadingOnRefresh: false,
              data: (price) => Text(price.toStringAsFixed(2).toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              error: (error, stack) => TextButton(onPressed: () {
                ref.invalidate(stockPriceProvider);
              },child: Text("Error : $error"),),
              loading: () => const CircularProgressIndicator()),
        );
      })
    );
  }
}
