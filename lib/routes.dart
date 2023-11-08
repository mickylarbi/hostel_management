import 'package:go_router/go_router.dart';
import 'package:hostel_management/screens/auth/login_screen.dart';

GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  initialLocation: '/login',
);
