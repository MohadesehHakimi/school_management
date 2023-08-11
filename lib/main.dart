import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'theme_settings/theme_data.dart';

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
      home: const LoginPage(),
    );
  }
}
