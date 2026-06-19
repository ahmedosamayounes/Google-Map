import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../../../../core/theming/my_colors.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentGeometry.topStart,
          child: SvgPicture.asset('assets/images/svgs/logo.svg'),
        ),
        Gap(50.h),
        Text(
          S.of(context).experienceSpeed,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: MyColors.blackColor,
          ),
        ),
        Gap(10.h),
        Text(
          S.of(context).joinFastestNetwork,
          style: TextStyle(fontSize: 16.sp, color: MyColors.secoundryColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
