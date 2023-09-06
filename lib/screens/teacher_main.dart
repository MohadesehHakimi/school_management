import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/teacher_mainPage_tabs_provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';


class TeacherMainPage extends ConsumerStatefulWidget {
  const TeacherMainPage({super.key});

  @override
  ConsumerState<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends ConsumerState<TeacherMainPage> {
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      const TeacherHomePage(),
      const TeacherHomePage(),
      const TeacherHomePage(),
      const TeacherProfile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = ref.watch(teacherHomepageTabsProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
