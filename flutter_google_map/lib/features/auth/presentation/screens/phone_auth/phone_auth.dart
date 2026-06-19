import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../../../core/shared/app_button.dart';
import '../../cubit/phone_auth_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/intro_text.dart';
import 'widgets/phone_auth_bloc_lisenter.dart';
import 'widgets/phone_form_field.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Form(
            key: phoneFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const IntroText(),
                  Gap(100.h),
                  const PhoneFormField(),
                  Gap(60.h),
                  AppButton(
                    name: S.of(context).sendCode,
                    onPressed: () => validateThenDoLogin(context, phoneFormKey),
                  ),
                  Gap(50.h),
                  const TermsAndConditionsText(),
                  const PhoneAuthBlocLisenter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context, GlobalKey<FormState> formKey) {
    final cubit = context.read<PhoneAuthCubit>();
    if (formKey.currentState!.validate()) {
      cubit.submitPhoneNumber();
    }
  }
}
