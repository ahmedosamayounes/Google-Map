import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../../core/shared/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/my_colors.dart';
import '../../logic/cubit/phone_auth_cubit.dart';
import 'widgets/intro_text_otp.dart';
import 'widgets/otp_auth_bloc_listener.dart';
import 'widgets/pin_code_field.dart';

class OtpAuth extends StatelessWidget {
  final String phoneNumber;
  const OtpAuth({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const IntroTextOtp(),
                Gap(35.h),
                const PinCode(),
                Gap(30.h),
                AppButton(
                  name: 'Verify',
                  onPressed: () {
                    verifyOtp(context);
                  },
                ),
                const OtpAuthBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context) {
    final cubit = context.read<PhoneAuthCubit>();
    final otpCode = cubit.otpController.text.trim();

    if (otpCode.length == 6) {
      cubit.submitOtp(otpCode);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the full 6-digit code'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
