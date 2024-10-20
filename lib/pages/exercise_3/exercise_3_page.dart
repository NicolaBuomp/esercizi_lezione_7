import 'package:esercizi_lezione_7/widgets/CustomSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../viewmodels/counter.viewmodel.dart';

class Exercise3Page extends HookConsumerWidget {
  const Exercise3Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterValue = ref.watch(counterProvider);
    final snackBarShown = useState(false);

    useEffect(() {
      if (counterValue == 10 && !snackBarShown.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomTopSnackBar.show(
            context,
            'Hai raggiunto il valore $counterValue!',
            backgroundColor: Colors.green,
          );
        });
        snackBarShown.value = true;
      } else if (counterValue != 10) {
        snackBarShown.value = false;
      }
      return null;
    }, [counterValue]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esercizio 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gestione Stato Complesso con Hooks',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              'Valore del contatore: $counterValue',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).decrement();
                  },
                  child: const Text('Diminuisci'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: const Text('Aumenta'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).reset();
              },
              child: const Text('Resetta'),
            ),
          ],
        ),
      ),
    );
  }
}
