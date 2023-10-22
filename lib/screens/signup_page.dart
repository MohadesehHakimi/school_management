import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../cloud_functions/auth_service.dart';
import '../providers/user_provider.dart';
import '../providers/user_type_provider.dart';
import '../screens/login_page.dart';
import '../screens/teacher_main.dart';
import '../screens/student_attendance_page.dart';


enum UserType {
  staff,
  teacher,
  student,
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  String emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  bool _isPasswordVisible = false;
  UserType _userType = UserType.teacher;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future<String> signupStudent() async {
    FocusManager.instance.primaryFocus?.unfocus();
    // sending data to firebase
    final message = await AuthService().registration(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      displayName: _displayNameController.text
          .split(' ')
          .map((e) => capitalize(e))
          .join(' ')
          .trim(),
    );
    bool isUser = await ref.read(userProvider.notifier).setUser();
    if (message == 'Success' && isUser) {
      final user = ref.read(userProvider);
      // sending data to django
      final response = await http.post(
        Uri.parse(
          'http://192.168.8.101:8000/students',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _displayNameController.text
              .split(' ')
              .map((e) => capitalize(e))
              .join(' ')
              .trim(),
          'email': _emailController.text.trim(),
          'student_uid': user!.uid,
        }),
      );
      return response.statusCode == 201
          ? 'Success'
          : 'Something went wrong. Please try again.';
    }
    return message!;
  }

  Future<String> signupTeacher() async {
    FocusManager.instance.primaryFocus?.unfocus();
    // sending data to firebase
    final message = await AuthService().registration(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      displayName: _displayNameController.text
          .split(' ')
          .map((e) => capitalize(e))
          .join(' ')
          .trim(),
    );
    bool isUser = await ref.read(userProvider.notifier).setUser();
    if (message == 'Success' && isUser) {
      final user = ref.read(userProvider);
      // sending data to django
      final response = await http.post(
        Uri.parse(
          'http://192.168.8.101:8000/teachers',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': _displayNameController.text
              .split(' ')
              .map((e) => capitalize(e))
              .join(' ')
              .trim(),
          'email': _emailController.text.trim(),
          'teacher_uid': user!.uid,
        }),
      );
      return response.statusCode == 201
          ? 'Success'
          : 'Something went wrong. Please try again.';
    }
    return message!;
  }

  Future<String> signupStaff() async {
    return 'Staff';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
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
                  controller: _displayNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: FaIcon(
                      FontAwesomeIcons.user,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 50.0,
                    ),
                    label: Text(
                      'Full Name',
                    ),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name.';
                    } else if (value.trim().length < 2) {
                      return 'Please enter a valid full name.';
                    } else if (value.trim().length > 50) {
                      return 'Maximum of 50 characters allowed.';
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
                    } else if (!RegExp(emailRegex).hasMatch(value)) {
                      return 'Email address is not valid.';
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
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long.';
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
                  child: DropdownButtonFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20.0,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: FaIcon(
                        FontAwesomeIcons.userGraduate,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 50.0,
                      ),
                      labelText: 'User Type',
                    ),
                    value: _userType,
                    onChanged: (value) {
                      setState(() {
                        _userType = value!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: UserType.staff,
                        child: Text(
                          'Staff',
                        ),
                      ),
                      DropdownMenuItem(
                        value: UserType.teacher,
                        child: Text(
                          'Teacher',
                        ),
                      ),
                      DropdownMenuItem(
                        value: UserType.student,
                        child: Text(
                          'Student',
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String signupMessage = '';
                      if (_userType == UserType.student) {
                        ref.read(userTypeProvider.notifier).setUserType(
                              UserType.student.name,
                            );
                        signupMessage = await signupStudent();
                      } else if (_userType == UserType.teacher) {
                        ref.read(userTypeProvider.notifier).setUserType(
                              UserType.teacher.name,
                            );
                        signupMessage = await signupTeacher();
                      } else if (_userType == UserType.staff) {
                        ref.read(userTypeProvider.notifier).setUserType(
                              UserType.staff.name,
                            );
                        signupMessage = await signupStaff();
                      }
                      signupMessage = signupMessage.length < 100
                          ? signupMessage
                          : 'An error occurred. Please try again later.';
                      if (signupMessage != 'Success') {
                        // delete the user from firebase if signup failed
                        await FirebaseAuth.instance.currentUser!.delete();
                      } else {
                        if (mounted) {
                          if (_userType == UserType.student) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const StudentAttendancePage(),
                              ),
                            );
                          } else if (_userType == UserType.teacher) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const TeacherMainPage(),
                              ),
                            );
                          } else if (_userType == UserType.staff) {

                          }
                          String snackbarMessage = signupMessage == 'Success'
                              ? 'You are successfully signed up!'
                              : signupMessage;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                snackbarMessage,
                              ),
                            ),
                          );
                        }
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
                    'Sign Up',
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }
}
