import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/get_api_riverpod/post_provider.dart';

class HomeScreenGetApi extends ConsumerWidget {
  const HomeScreenGetApi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('GET API CALL')),
      ),
      body: Center(
        child: postList.when(data: (data) => ListView.builder(
          itemCount: data.length,
            itemBuilder: (context,index) {
              return ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].body),
              );
            }),
            error: (error, stack) => Text("Error : $error"),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
