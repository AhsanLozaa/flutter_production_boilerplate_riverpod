import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state.dart';

class BottomNavBarNotifier extends StateNotifier<BottomNavBarState> {
  BottomNavBarNotifier() : super(const BottomNavBarState());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final navProvider =
    StateNotifierProvider<BottomNavBarNotifier, BottomNavBarState>(
        (ref) => BottomNavBarNotifier());
