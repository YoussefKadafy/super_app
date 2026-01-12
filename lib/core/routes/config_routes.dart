import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
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
    ],
  );
}
