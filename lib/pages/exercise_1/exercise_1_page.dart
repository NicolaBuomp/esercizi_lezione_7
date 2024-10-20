import 'package:esercizi_lezione_7/pi/counter.provider.dart';
import 'package:esercizi_lezione_7/widgets/CustomSnackBar.dart'; // Importa il tuo widget personalizzato
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Exercise1Page extends ConsumerWidget {
  const Exercise1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Utilizzo di `select` per osservare solo `counter1`
    final counter1 =
        ref.watch(counterProvider1.select((state) => state.counter1));
    // Utilizzo di `select` per osservare solo `counter2`
    final counter2 =
        ref.watch(counterProvider1.select((state) => state.counter2));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esercizio 1: Riverpod con due contatori'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Visualizzazione del primo contatore
                const Text('Counter 1', style: TextStyle(fontSize: 24)),
                Text('$counter1',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ref.read(counterProvider1.notifier).incrementCounter1();
                      },
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(counterProvider1.notifier).incrementCounter1();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Counter 2', style: TextStyle(fontSize: 24)),
                Text('$counter2',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ref.read(counterProvider1.notifier).incrementCounter2();
                      },
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(counterProvider1.notifier).incrementCounter2();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if ((counter1 + counter2) % 2 == 0) {
            CustomTopSnackBar.show(
              context,
              'La somma dei due counter è divisibile per 2!',
              backgroundColor: Colors.green,
            );
          } else if (counter1 % 2 == 0 && counter2 % 2 != 0) {
            CustomTopSnackBar.show(
              context,
              'Solo il counter 1 è divisibile per 2!',
              backgroundColor: Colors.orange,
            );
          } else if (counter1 % 2 != 0 && counter2 % 2 == 0) {
            CustomTopSnackBar.show(
              context,
              'Solo il counter 2 è divisibile per 2!',
              backgroundColor: Colors.orange,
            );
          } else if (counter1 % 2 != 0 && counter2 % 2 != 0) {
            CustomTopSnackBar.show(
              context,
              'Nessun counter è divisibile per 2!',
              backgroundColor: Colors.red,
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
