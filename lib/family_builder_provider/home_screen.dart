

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roadmap/family_builder_provider/family_provider.dart';

class HomeScreenFamilyProvider extends ConsumerWidget {
  const HomeScreenFamilyProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(multipleProvider(10));

    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Future Stream Provider')),
        ),
        body: Center(child: Text(result.toString()),)
    );
  }
}
