import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockPriceProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0;
  while(true) {
    await Future.delayed(const Duration(seconds: 1));
    //Simulate price fluctuation
    currentPrice += random.nextDouble() * 4 - 2; // Random change between -2 and +2
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
}); //StreamProvider