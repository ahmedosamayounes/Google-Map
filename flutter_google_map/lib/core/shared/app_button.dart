import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/my_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.name, this.onPressed});

  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // remove the default padding
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 65),
        ), // set the button to full width and a fixed height
        backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
        shape: MaterialStateProperty.all( 
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
