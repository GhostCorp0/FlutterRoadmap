import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// STATE PROVIDER MULTIPLE STATES EXAMPLE

final sliderProvider = StateProvider<double>((ref) {
  return 0.0;
});


final sliderProviderAppState = StateProvider<AppState >((ref) {
  return AppState(slider: .5, showPassword: false);
});

class HomeScreenMultipleStateProvider extends ConsumerStatefulWidget {
  const HomeScreenMultipleStateProvider({super.key});

  @override
  ConsumerState<HomeScreenMultipleStateProvider> createState() =>
      _HomeScreenStateProviderState();
}

class _HomeScreenStateProviderState
    extends ConsumerState<HomeScreenMultipleStateProvider> {
  @override
  Widget build(BuildContext context) {
    final slider = ref.watch(sliderProviderAppState);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap:  () {
              final stateProvider = ref.read(sliderProviderAppState.notifier);
              stateProvider.state =  stateProvider.state.copyWith( showPassword: ! slider.showPassword);
            },
            child: Container(
              height: 200,
              width: 200,
              child: slider.showPassword?Icon(Icons.remove_red_eye):Icon(Icons.image ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.red.withOpacity(slider.slider),
          ),
          Slider(
              value: slider.slider,
              onChanged: (value) {
                final stateProvider = ref.read(sliderProviderAppState.notifier);
                stateProvider.state =  stateProvider.state.copyWith(slider: value);
              })
        ],
      ),
    );
  }
}

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({
    double? slider,
    bool? showPassword,
}) {
    return AppState(slider: slider?? this.slider, showPassword: showPassword?? this.showPassword);
  }


}