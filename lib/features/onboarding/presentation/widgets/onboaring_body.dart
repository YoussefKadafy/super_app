import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:super_app/features/onboarding/data/onboarding_data.dart';

class OnboaringBody extends StatefulWidget {
  const OnboaringBody({super.key});

  @override
  State<OnboaringBody> createState() => _OnboaringBodyState();
}

class _OnboaringBodyState extends State<OnboaringBody> {
  late PageController _pageController;
  int _currentPage = 0;
  final OnboardingData _data = OnboardingData();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onNextButtonPressed() {
    if (_currentPage < _data.titles.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      context.pushNamed(AppRoutes.login);
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _data.titles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _data.titles[index],
                        textAlign: TextAlign.center,
                        style: AppStyles.onboardingTitle,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        _data.subtitles[index],
                        textAlign: TextAlign.center,
                        style: AppStyles.onboardingSubTitle,
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                OnboardingButton(
                  data: _data,
                  currentPage: _currentPage,
                  onPressed: _onNextButtonPressed,
                ),
                SizedBox(height: 26.h),
                DotsIndicator(
                  dotsCount: _data.titles.length,
                  position: _currentPage.toDouble(),
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: AppColors.primary,
                    size: Size(12.w, 12.h),
                    activeSize: Size(12.w, 12.h),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }
}
