import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
