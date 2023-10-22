import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageTabsNotifier extends StateNotifier<int> {
  MainPageTabsNotifier() : super(0);

  void changeTab(int index) {
    state = index;
  }
}

final mainPageTabsProvider =
    StateNotifierProvider<MainPageTabsNotifier, int>(
        (ref) => MainPageTabsNotifier());
