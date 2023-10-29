import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_management/screens/student/student_home_page.dart';
import 'package:school_management/screens/student/student_profile.dart';

import '../../providers/main_page_tabs_provider.dart';
import '../../widgets/bottom_navigation_bar.dart';


class StudentMainPage extends ConsumerWidget {
  const StudentMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(mainPageTabsProvider);

    List<Widget> pages = <Widget>[
      const StudentHomePage(),
      const StudentHomePage(),
      const StudentHomePage(),
      const StudentProfile(),
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