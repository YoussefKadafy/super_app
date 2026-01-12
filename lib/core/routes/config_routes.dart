import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
import 'package:super_app/splash_screen.dart';

class ConfigRoutes {
  static final GoRouter routerConfig = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) {
          return const OnboardingTextAnimation();
        },
      ),
    ],
  );
}
