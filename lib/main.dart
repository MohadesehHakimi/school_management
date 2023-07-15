import 'package:flutter/material.dart';

import 'theme_settings/theme_data.dart';
import 'screens/teacher_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management',
      debugShowCheckedModeBanner: false,
      theme: preferredThemeData(),
      home: const TeacherHomePage(),
    );
  }
}
