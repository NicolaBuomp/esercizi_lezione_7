import 'package:esercizi_lezione_7/widgets/CustomSnackBar.dart'; // Importa il tuo widget personalizzato
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definisco il provider per il contatore
final counterProvider = StateProvider<int>((ref) => 0);

class Exercise1Page extends ConsumerWidget {
  const Exercise1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esercizio 1: Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Valore del contatore: $count',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Text('Incrementa'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final count = ref.read(counterProvider);
          if (count % 2 == 0) {
            CustomTopSnackBar.show(
              context,
              'Il contatore è divisibile per 2!',
              backgroundColor: Colors.green,
            );
          } else {
            CustomTopSnackBar.show(
              context,
              'Il contatore non è divisibile per 2!',
              backgroundColor: Colors.red,
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
