import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserTypeNotifier extends StateNotifier<String> {
  UserTypeNotifier() : super('');

  void setUserType(String userType) {
    state = userType;
  }
}

final userTypeProvider =
    StateNotifierProvider<UserTypeNotifier, String>((ref) => UserTypeNotifier());