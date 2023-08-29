import 'package:essential/design/pages/add.dart';
import 'package:essential/design/pages/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/add',
      name: '/add',
      builder: (context, state) => const Add(),
    ),
  ],
);
