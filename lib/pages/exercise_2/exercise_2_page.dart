import 'package:esercizi_lezione_7/viewmodels/post.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Exercise2Page extends ConsumerWidget {
  const Exercise2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista dei Post'),
      ),
      body: postState.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 50, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    'Nessun post disponibile.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stack) {
          return Center(
            child: Text('Errore: $error'),
          );
        },
      ),
    );
  }
}
