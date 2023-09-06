import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickedDateNotifier extends StateNotifier<DateTime> {
  PickedDateNotifier() : super(DateTime.now());

  void changeDate(DateTime date) {
    state = date;
  }
}

final pickedDateProvider =
    StateNotifierProvider<PickedDateNotifier, DateTime>((ref) => PickedDateNotifier());
