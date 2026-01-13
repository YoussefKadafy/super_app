import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:super_app/core/routes/app_routes.dart';
import 'package:super_app/core/styles/app_colors.dart';
import 'package:super_app/core/styles/app_styles.dart';
import 'package:super_app/features/onboarding/presentation/widgets/onboaring_body.dart';

class OnboardingTextAnimation extends StatefulWidget {
  const OnboardingTextAnimation({super.key});

  @override
  State<OnboardingTextAnimation> createState() =>
      _OnboardingTextAnimationState();
}

class _OnboardingTextAnimationState extends State<OnboardingTextAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> word1Y;
  late final Animation<double> wordsGroupY;
  late final Animation<double> containerOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    /// Ап: من 0.5 → 0.4 فقط
    word1Y = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.5,
          end: 0.4,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(tween: ConstantTween(0.4), weight: 60),
    ]).animate(_controller);

    /// الجروب (Супер + Ап): من 0.4 → 0.2
    wordsGroupY = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0.4), weight: 40),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.4,
          end: 0.2,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
    ]).animate(_controller);

    /// الكونتينر
    containerOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 70),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                children: [
                  /// الكلمات
                  Positioned(
                    top: height * wordsGroupY.value,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Супер',
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Transform.translate(
                          offset: Offset(0, height * (word1Y.value - 0.4)),
                          child: const Text(
                            'Ап',
                            style: TextStyle(
                              fontSize: 65,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// الكونتينر
                  Positioned(
                    top: height * 0.5,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: containerOpacity.value,
                      child: Container(
                        height: 379.h,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(child: OnboaringBody()),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18.h,
                    right: 24.w,
                    child: SafeArea(
                      child: Opacity(
                        opacity: containerOpacity.value,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.login);
                          },
                          child: Text(
                            'Пропустить',
                            style: AppStyles.wight400Size16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
