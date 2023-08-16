import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:school_management/cloud_functions/auth_service.dart';
import '../screens/signup_page.dart';
import '../screens/teacher_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 10.0,
              ),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: FaIcon(
                    FontAwesomeIcons.envelope,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 50.0,
                  ),
                  label: Text(
                    'Email',
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 10.0,
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon: const FaIcon(
                    FontAwesomeIcons.lock,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 50.0,
                  ),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: FaIcon(
                      _isPasswordVisible
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                    ),
                  ),
                  label: const Text(
                    'Password',
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () async {
                  final message = await AuthService().login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  late final User user;
                  FirebaseAuth.instance
                      .authStateChanges()
                      .listen((User? thisUser) {
                    if (thisUser != null) {
                      user = thisUser;
                    }
                  });
                  if (mounted) {
                    if (message!.contains('Success')) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TeacherMainPage(user: user),
                        ),
                      );
                    }
                    String loginMessage = (
                      message.contains('Success')
                        ? 'You have successfully logged in!'
                        : message
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(loginMessage),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 5.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,)
          ],
        )
      ),
    );
  }
}
