import 'package:flutter/material.dart';
import '../../../../../../core/theming/my_colors.dart';

class ButtonField extends StatelessWidget {
  ButtonField({super.key, required this.name, required this.onPressed});
  final String name;
  final Function()? onPressed;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _phoneFormKey,
      child: ElevatedButton.icon(
        icon: Icon(Icons.send, color: Colors.white),

        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: MyColors.primaryColor,
        ),
        onPressed: onPressed,
        label: Text(name, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
