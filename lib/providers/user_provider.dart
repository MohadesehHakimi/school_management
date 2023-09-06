import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  Future<bool> setUser() async {
    Future<bool> isUser = FirebaseAuth.instance.authStateChanges().map((User? user) {
      if (user != null) {
        state = user;
        return true;
      } else {
        return false;
      }
    }).first;
    return isUser;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());
