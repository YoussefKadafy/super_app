import 'package:flutter/material.dart';
import 'package:super_app/core/utils/sized_box_extension.dart';
import 'package:super_app/features/auth/presentation/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [80.height, LoginBody()],
      ),
    );
  }
}
