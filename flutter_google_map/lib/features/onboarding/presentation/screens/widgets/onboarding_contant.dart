import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContant extends StatelessWidget {
  const OnboardingContant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).swiftAsThought,
          style: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.textColor,
          ),
        ),
        Gap(10.h),
        Text(
          S.of(context).onboardingDescription,
          style: TextStyle(fontSize: 18.sp, color: MyColors.secoundryColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
