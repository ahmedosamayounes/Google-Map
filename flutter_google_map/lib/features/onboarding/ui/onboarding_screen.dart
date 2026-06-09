import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/router/routes_string.dart';
import '../../../core/shared/app_button.dart';
import 'widgets/onboarding_contant.dart';
import 'widgets/onboarding_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OnboardingHeader(),
                const OnboardingContant(),
                Gap(30.h),
                AppButton(
                  name: 'Get Started',
                  onPressed: () => context.pushNamed(phoneScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
