import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/router/routes_string.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/phone_auth_cubit.dart';


class OtpAuthBlocListener extends StatelessWidget {
  const OtpAuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }
        if (state is PhoneOtpVerified) {
          Navigator.pop(context);
          Navigator.pushNamed(context, mapScreen);
        }
        if (state is PhoneAuthSubmitted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).phoneVerifiedSuccess),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
        }
        if (state is PhoneAuthError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void showProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      barrierColor: Colors.white.withOpacity(0),
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ),
    );
  }
}
