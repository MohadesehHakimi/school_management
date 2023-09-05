import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/teacher_mainPage_tabs_provider.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';


class TeacherMainPage extends ConsumerStatefulWidget {
  const TeacherMainPage({super.key, required this.user});

  final User user;

  @override
  ConsumerState<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends ConsumerState<TeacherMainPage> {
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      TeacherHomePage(user: widget.user,),
      TeacherHomePage(user: widget.user,),
      TeacherHomePage(user: widget.user,),
      TeacherProfile(user: widget.user,),
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
