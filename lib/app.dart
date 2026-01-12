import 'package:flutter/material.dart';
import 'package:super_app/core/routes/config_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Super App',
      debugShowCheckedModeBanner: false,
      routerConfig: ConfigRoutes.routerConfig,
    );
  }
}
