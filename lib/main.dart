import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:school_management/screens/teacher_main.dart';
import 'firebase_options.dart';

// import 'screens/login_page.dart';
import 'theme_settings/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const TeacherMainPage(),
    );
  }
}
