

import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async{
  await Future.delayed(const Duration(seconds:5));
  return 3;
}); // FutureProvider

