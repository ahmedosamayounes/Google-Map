import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/cubit/phone_auth_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/router/routes_string.dart';
import '../../../../core/theming/my_colors.dart';

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
    final currentUser = phoneAuthCubit.getLoggedInUser();
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
                  '${currentUser?.phoneNumber}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          buildDrawerItem(leadingIcon: Icons.home, title: S.of(context).home),
          buildDrawerItem(
            leadingIcon: Icons.settings,
            title: S.of(context).settings,
          ),
          buildDrawerItem(leadingIcon: Icons.info, title: S.of(context).about),
          buildDrawerItem(
            leadingIcon: Icons.logout,
            title: S.of(context).logout,
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
