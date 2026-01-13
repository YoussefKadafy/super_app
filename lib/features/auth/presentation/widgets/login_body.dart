import 'package:flutter/material.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/core/utils/sized_box_extension.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Номер телефона', style: AppStyles.wight600Size24),
        20.height,
      ],
    );
  }
}
