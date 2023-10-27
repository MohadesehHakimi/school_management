import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../cloud_functions/auth_service.dart';
import '../providers/loading_animation_provider.dart';
import '../providers/user_provider.dart';
import '../providers/user_type_provider.dart';
import '../screens/signup_page.dart';
import '../screens/student_main.dart';
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

  Future<String> _fetchUserType() async {
    final user = ref.read(userProvider);
    String userId = user!.uid;
    final userType = await http.get(
      Uri.parse('http://192.168.8.101:8000/find-user-type/$userId'),
    );
    try {
      return jsonDecode(userType.body)['type'];
    } catch (e) {
      return 'error';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingAnimationProvider);

    Widget buildScaffoldBody;
    if (isLoading) {
      buildScaffoldBody = Center(
        child: LoadingAnimationWidget.newtonCradle(
          color: Colors.blue,
          size: 170.0,
        ),
      );
    } else {
      buildScaffoldBody = Form(
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
                  if (value == null || value.trim().isEmpty) {
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
                  if (value == null || value.trim().isEmpty) {
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
                  InkWell(
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
                  // change isLoading to true
                  ref.read(loadingAnimationProvider.notifier).setLoading(true);
                  var userType = '';
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (_formKey.currentState!.validate()) {
                    final message = await AuthService().login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                    bool isUser =
                        await ref.read(userProvider.notifier).setUser();
                    if (message == 'Success' && isUser) {
                      // check the user type and navigate to the appropriate page
                      userType = await _fetchUserType();
                      if (mounted) {
                        if (userType == 'teacher') {
                          ref.read(userTypeProvider.notifier).setUserType(
                                'teacher',
                              );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const TeacherMainPage(),
                            ),
                          );
                        } else if (userType == 'student') {
                          ref.read(userTypeProvider.notifier).setUserType(
                                'student',
                              );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const StudentMainPage(),
                            ),
                          );
                        } else if (userType == 'staff') {
                          ref.read(userTypeProvider.notifier).setUserType(
                                'staff',
                              );
                        }
                      }
                    }
                    String? loginMessage =
                        message == 'Success' && userType != 'error'
                            ? 'You have successfully logged in!'
                            : (message == 'Success' && userType == 'error'
                                ? 'An error occurred. Please try again.'
                                : message);
                    loginMessage = loginMessage!.length > 100
                        ? 'An error occurred. Please try again.'
                        : loginMessage;
                    if (mounted) {
                      // change isLoading to false
                      ref
                          .read(loadingAnimationProvider.notifier)
                          .setLoading(false);
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
              child: InkWell(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: buildScaffoldBody,
      ),
    );
  }
}
