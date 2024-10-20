import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definisco lo stato con due contatori
class CounterState {
  final int counter1;
  final int counter2;

  CounterState({this.counter1 = 0, this.counter2 = 0});

  CounterState copyWith({int? counter1, int? counter2}) {
    return CounterState(
      counter1: counter1 ?? this.counter1,
      counter2: counter2 ?? this.counter2,
    );
  }
}

// Definisco il gestore dello stato utilizzando StateNotifier
class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState());

  void incrementCounter1() {
    state = state.copyWith(counter1: state.counter1 + 1);
  }

  void incrementCounter2() {
    state = state.copyWith(counter2: state.counter2 + 1);
  }
}

// Definisco il provider per gestire entrambi i contatori
final counterProvider1 = StateNotifierProvider<CounterNotifier, CounterState>(
  (ref) => CounterNotifier(),
);
