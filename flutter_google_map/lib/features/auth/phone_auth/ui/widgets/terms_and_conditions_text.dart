import 'package:flutter/material.dart';
import '../../../../../core/theming/my_colors.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By proceeding, you agree to our',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: ' Terms of Service',
            style: TextStyle(color: MyColors.primaryColor),
          ),
          TextSpan(
            text: ' and',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyle(color: MyColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
