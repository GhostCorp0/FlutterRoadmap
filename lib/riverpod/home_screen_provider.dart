 import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PROVIDER EXAMPLE

// to read constant value
final hello = Provider<String>((ref){
  return "My name is Aman";
});

 final age = Provider<int>((ref){
   return 23;
 });


 // For stateful widget

 class HomeScreen extends ConsumerStatefulWidget {
   const HomeScreen({super.key});

   @override
   ConsumerState<HomeScreen> createState() => _HomeScreenState();
 }

 class _HomeScreenState extends ConsumerState<HomeScreen> {
   @override
   Widget build(BuildContext context) {
     final subscribe = ref.watch(hello);
     final tempAge =  ref.watch(age);

     return Scaffold(
       appBar: AppBar(),
       body: Center(
         child: Text(subscribe +" "+ tempAge.toString(),style: TextStyle(fontSize: 30) ,),
       ),
     );
   }
 }


 // For stateless widget

/*
class HomeScreen extends ConsumerWidget  {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    final subscribe = ref.watch(hello);
    final tempAge =  ref.watch(age);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(subscribe +" "+ tempAge.toString(),style: TextStyle(fontSize: 30) ,),
      ),
    );
  }
}
*/
