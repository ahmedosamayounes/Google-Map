import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/my_colors.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/phone_auth_cubit.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key});

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );

    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return S.of(context).enterPhoneNumber;
        }
        if (value.trim().length < 10) {
          return S.of(context).invalidPhoneNumber;
        }
        return null;
      },
      controller: context.read<PhoneAuthCubit>().phoneController,
      keyboardType: TextInputType.phone,
      cursorColor: MyColors.blackColor,
      autofocus: true,
      style: TextStyle(
        fontSize: 20,

        color: MyColors.blackColor,
        letterSpacing: 1.5,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.backgroundColor,
        hintText: "000 000 0000",
        labelText: S.of(context).phoneNumber,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: MyColors.blackColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.backgroundColor),

          borderRadius: BorderRadius.circular(10),
        ),

        labelStyle: TextStyle(color: MyColors.blackColor),
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            "${generateCountryFlag()} +20",
            style: TextStyle(fontSize: 18, color: MyColors.blackColor),
          ),
        ),
      ),
    );
  }
}
