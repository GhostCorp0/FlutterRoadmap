import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// STATE PROVIDER EXAMPLE

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

/*
class HomeScreenStateProvider extends ConsumerWidget {
  const HomeScreenStateProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
         children: [
           Consumer(
               builder: (context,ref,child) {
                 final count = ref.watch(counter);

                 return Center(
                   child: Text(count.toString(),style: TextStyle(fontSize: 30),),
                 );
               }
           ),
           Consumer(
               builder: (context,ref,child) {
                 final count = ref.watch(switchProvider);
                 return Center(
                   child: Switch(value: count ,onChanged: (value) {
                     ref.read(switchProvider.notifier).state = value;
                   },),
                 );
               }
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(onPressed: () {
                 ref.read(counter.notifier).state++;
               }, child: Text('+ '))
             ],
           )
         ],
      ),
    );
  }
}
*/

class HomeScreenStateProvider extends ConsumerStatefulWidget {
  const HomeScreenStateProvider({super.key});

  @override
  ConsumerState<HomeScreenStateProvider> createState() =>
      _HomeScreenStateProviderState();
}

class _HomeScreenStateProviderState
    extends ConsumerState<HomeScreenStateProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(counter);

            return Center(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 30),
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(switchProvider);
            return Center(
              child: Switch(
                value: count,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text('+ '))
            ],
          )
        ],
      ),
    );
  }
}
