import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
import 'package:super_app/features/auth/presentation/screens/login_screen.dart';
import 'package:super_app/features/auth/presentation/screens/recive_code_screen.dart';
import 'package:super_app/features/onboarding/presentation/screens/onboarding_screen.dart';

class ConfigRoutes {
  static final GoRouter routerConfig = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) {
          return const OnboardingTextAnimation();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.reciveCode,
        name: AppRoutes.reciveCode,
        builder: (context, state) {
          final phoneNumber = state.extra as String;
          return ReciveCodeScreen(phoneNumber: phoneNumber);
        },
      ),
    ],
  );
}
