import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';
import '../features/image/screens/image_screen.dart';
import '../features/splash/screens/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ImageScreen.routePath,
      builder: (context, state) => ImageScreen(
        prompt: state.extra as String,
      ),
    ),
  ],
);
