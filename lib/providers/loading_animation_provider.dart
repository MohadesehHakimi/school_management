import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingAnimationNotifier extends StateNotifier<bool> {
  LoadingAnimationNotifier() : super(false);

  void setLoading(bool value) {
    state = value;
  }
}

final loadingAnimationProvider =
    StateNotifierProvider<LoadingAnimationNotifier, bool>(
        (ref) => LoadingAnimationNotifier());