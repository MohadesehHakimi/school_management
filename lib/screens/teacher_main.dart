import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/main_page_tabs_provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';


class TeacherMainPage extends ConsumerWidget {
  const TeacherMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(mainPageTabsProvider);

    List<Widget> pages = <Widget>[
      const TeacherHomePage(),
      const TeacherHomePage(),
      const TeacherHomePage(),
      const TeacherProfile(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
