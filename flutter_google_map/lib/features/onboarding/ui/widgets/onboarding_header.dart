import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.h),
        Center(child: SvgPicture.asset('assets/images/svgs/logo.svg')),
        Gap(20.h),
        Image.asset(
          'assets/images/onboarding.png',
          fit: BoxFit.cover,
          height: 300.h,
        ),
      ],
    );
  }
}
