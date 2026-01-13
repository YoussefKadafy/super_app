import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/features/onboarding/data/onboarding_data.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required OnboardingData data,
    required int currentPage,
    this.onPressed,
  }) : _data = data,
       _currentPage = currentPage;
  final void Function()? onPressed;
  final OnboardingData _data;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          _data.buttonTitles[_currentPage],
          style: AppStyles.wight600Size16,
        ),
      ),
    );
  }
}
