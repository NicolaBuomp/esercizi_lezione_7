import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esercizi di gestione dello stato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.push('/exercise1');
              },
              child: const Text('Esercizio 1'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/exercise2');
              },
              child: const Text('Esercizio 2'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/exercise3');
              },
              child: const Text('Esercizio 3'),
            ),
          ],
        ),
      ),
    );
  }
}
