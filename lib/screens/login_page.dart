import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cloud_functions/auth_service.dart';
import '../providers/user_provider.dart';
import '../screens/signup_page.dart';
import '../screens/teacher_main.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    return null;
                  },
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
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
                    if (_formKey.currentState!.validate()) {
                      final message = await AuthService().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      bool isUser = await ref.read(userProvider.notifier).setUser();
                      if (mounted) {
                        if (message!.contains('Success') && isUser) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const TeacherMainPage(),
                            ),
                          );
                        }
                        String loginMessage = (
                            message.contains('Success') && isUser
                                ? 'You have successfully logged in!'
                                : message
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(loginMessage),
                          ),
                        );
                      }
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
          ),
        )
      ),
    );
  }
}
