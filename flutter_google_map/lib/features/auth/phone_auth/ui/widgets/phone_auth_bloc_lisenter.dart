import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/my_colors.dart';
import '../../../../../core/router/routes_string.dart';
import '../../../logic/cubit/phone_auth_cubit.dart';

class PhoneAuthBlocLisenter extends StatelessWidget {
  const PhoneAuthBlocLisenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }
        if (state is PhoneAuthSubmitted) {
          Navigator.pop(context);
          final phoneNumber = context
              .read<PhoneAuthCubit>()
              .phoneController
              .text
              .trim();
          Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
        }

        if (state is PhoneAuthError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(MyColors.primaryColor),
        ),
      ),
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0),

      builder: (context) => alertDialog,
    );
  }
}
