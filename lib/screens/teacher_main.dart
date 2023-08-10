import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';

const List<Widget> pages = <Widget>[
  TeacherHomePage(),
  TeacherHomePage(),
  TeacherHomePage(),
  TeacherProfile(),
];

int selectedIndex = 0;

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key});

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends State<TeacherMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabChange: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
