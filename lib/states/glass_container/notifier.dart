import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state.dart';

class GlasssContinerNotifier extends StateNotifier<GlassContainerState> {
  GlasssContinerNotifier() : super(const GlassContainerState(filledValue: 0));

  void onFilledValueChange(double filledValue) {
    state = state.copyWith(filledValue: filledValue);
  }

  void incrementFilledValue() {
    // Increment the filledValue by 10
    state = state.copyWith(filledValue: state.filledValue + 10);
  }

  void decrementFilledValue() {
    // Decrement the filledValue by 10
    state = state.copyWith(filledValue: state.filledValue - 10);
  }
}

final glassContainerProivder =
    StateNotifierProvider<GlasssContinerNotifier, GlassContainerState>(
        (ref) => GlasssContinerNotifier());
