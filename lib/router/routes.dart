import 'package:go_router/go_router.dart';
import 'package:updown_game_app/screen/game_page_screen.dart';
import 'package:updown_game_app/screen/home_page_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePageScreen();
      },
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) {
        return const GamePageScreen();
      },
    ),
  ],
);
