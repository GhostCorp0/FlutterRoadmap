import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/riverpod/state_notifier_provider.dart';

 class StateNotifierHomeScreen extends ConsumerWidget {
   const StateNotifierHomeScreen({super.key});

   @override
   Widget build(BuildContext context,WidgetRef ref) {
     final search = ref.watch(searchProvider);

     //for only reading one state not the whole one
     final isChange = ref.watch((searchProvider).select((state) => state.isChange));

     return Scaffold(
       appBar: AppBar(
         title: const Text('State Notifier'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextField(
             onChanged:(value) {
               ref.read(searchProvider.notifier).search(value);
             },
           ),
           Text(search.search),
           Switch(value: search.isChange, onChanged: (value) {
             ref.read(searchProvider.notifier).onChange(value);
           })
         ],
       ),
     );
   }
 }



