// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../logic/cubit/phone_auth_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialPinField(
        pinController: context.read<PhoneAuthCubit>().otpController,
        autoFocus: true,
        length: 6,
        keyboardType: TextInputType.number,
        obscureText: false,
        theme: MaterialPinTheme(
          cursorColor: Colors.black,
          shape: MaterialPinShape.outlined,
          cellSize: const Size(40, 50),
          spacing: 15.sp,
          borderRadius: BorderRadius.circular(5.r),
          borderWidth: 1,
          focusedBorderWidth: 2,
          borderColor: MyColors.primaryColor,
          focusedBorderColor: MyColors.primaryColor,
          filledBorderColor: MyColors.primaryColor,
          fillColor: Colors.white,
          focusedFillColor: Colors.white,
          filledFillColor: MyColors.primaryColor,
        ),
        onChanged: (value) {
          print(value);
        },
        onCompleted: (submitedCode) {
          context.read<PhoneAuthCubit>().submitOtp(submitedCode);
        },
      ),
    );
  }
}
