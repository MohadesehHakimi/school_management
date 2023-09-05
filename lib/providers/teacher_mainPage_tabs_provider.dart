import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeacherMainPageTabsNotifier extends StateNotifier<int> {
  TeacherMainPageTabsNotifier() : super(0);

  void changeTab(int index) {
    state = index;
  }
}

final teacherHomepageTabsProvider =
    StateNotifierProvider<TeacherMainPageTabsNotifier, int>(
        (ref) => TeacherMainPageTabsNotifier());
