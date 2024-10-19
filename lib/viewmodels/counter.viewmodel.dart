import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterViewModel, int>(
  (ref) => CounterViewModel(),
);

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }

  void decrement() {
    state--;
  }
}
