// GoRouter configuration
import 'package:esercizi_lezione_7/pages/exercise_1/exercise_1_page.dart';
import 'package:esercizi_lezione_7/pages/exercise_2/exercise_2_page.dart';
import 'package:esercizi_lezione_7/pages/exercise_3/exercise_3_page.dart';
import 'package:esercizi_lezione_7/pages/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/exercise1',
        name: 'exercise1',
        builder: (context, state) => const Exercise1Page(),
      ),
      GoRoute(
        path: '/exercise2',
        name: 'exercise2',
        builder: (context, state) => const Exercise2Page(),
      ),
      GoRoute(
        path: '/exercise3',
        name: 'exercise3',
        builder: (context, state) => const Exercise3Page(),
      ),
    ],
  );
});
