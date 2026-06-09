import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/routes_string.dart';
import '../../../../core/theming/my_colors.dart';
import '../../../auth/logic/cubit/phone_auth_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildDrawerItem({
    required IconData leadingIcon,
    required String title,
    Widget? trailing,
    Function()? onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(leadingIcon, color: color ?? MyColors.primaryColor),
      title: Text(title),
      trailing: trailing ??= Icon(
        Icons.arrow_right,
        color: MyColors.primaryColor,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneAuthCubit = BlocProvider.of<PhoneAuthCubit>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: MyColors.primaryColor),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: MyColors.primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${phoneAuthCubit.getLoggedIUser().phoneNumber}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          buildDrawerItem(leadingIcon: Icons.home, title: 'Home'),
          buildDrawerItem(leadingIcon: Icons.settings, title: 'Settings'),
          buildDrawerItem(leadingIcon: Icons.info, title: 'About'),
          buildDrawerItem(
            leadingIcon: Icons.logout,
            title: 'Logout',
            color: MyColors.redColor,
            onTap: () {
              phoneAuthCubit.signOut();
              Navigator.of(context).pushReplacementNamed(phoneScreen);
            },
            trailing: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
