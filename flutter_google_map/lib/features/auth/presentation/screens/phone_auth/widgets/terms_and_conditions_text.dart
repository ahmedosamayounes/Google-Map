import 'package:flutter/material.dart';
import '../../../../../../core/theming/my_colors.dart';
import '../../../../../../generated/l10n.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: S.of(context).byProceeding,
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: S.of(context).termsOfService,
            style: TextStyle(color: MyColors.primaryColor),
          ),
          TextSpan(
            text: S.of(context).and,
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: S.of(context).privacyPolicy,
            style: TextStyle(color: MyColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
