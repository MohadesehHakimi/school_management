import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';


int selectedIndex = 0;

class TeacherMainPage extends StatefulWidget {
  const TeacherMainPage({super.key, required this.user});

  final User user;

  @override
  State<TeacherMainPage> createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends State<TeacherMainPage> {
  late final List<Widget> pages;
  @override
  void initState() {
    pages = <Widget>[
      TeacherHomePage(user: widget.user,),
      TeacherHomePage(user: widget.user,),
      TeacherHomePage(user: widget.user,),
      TeacherProfile(user: widget.user,),
    ];
    super.initState();
  }
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
