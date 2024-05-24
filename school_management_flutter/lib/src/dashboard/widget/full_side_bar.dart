import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/dashboard/widget/side_bar.dart';

import '../view/dashboard.dart';
import 'dashboard_body.dart';

class FullSideBar extends StatefulWidget {
  const FullSideBar({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<FullSideBar> createState() => _FullSideBarState();
}

class _FullSideBarState extends State<FullSideBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 250,
      child: SideBar(
        backgroundColor: context.theme.canvasColor,
        activeBackgroundColor: Colors.red,
        activeIconColor: AppColors.statusUnderstock,
        iconColor: const Color(0xFF000000),
        textStyle: context.theme.textTheme.labelLarge!.copyWith(
          fontSize: 13,
          letterSpacing: .5,
          color: const Color(0xff292929),
          fontWeight: FontWeight.w600,
        ),
        activeTextStyle: context.theme.textTheme.labelLarge!.copyWith(
          fontSize: 13,
          letterSpacing: .5,
          color: AppColors.statusUnderstock,
          fontWeight: FontWeight.w600,
        ),
        width: 418.w,
        items: permissions!,
        selectedRoute: selectedRoute!,
        onSelected: (item) {
          if (item.route != null && item.route != selectedRoute) {
            setState(() {
              selectedRoute = item.route!;
            });
            context.push(item.route!);
            if (ResponsiveBreakpoints.of(context).equals(MOBILE) ||
                ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
              Scaffold.of(context).closeDrawer();
            }
            // CustomNavigationHelper.router.refresh();
            // widget.child.goBranch(int.parse(item.route!));
          }
        },
        footer: GestureDetector(
          onTap: () {
            if (selectedRoute != '/SettingsScreen') {
              selectedRoute = '/SettingsScreen';
              context.push('/SettingsScreen');
              if (ResponsiveBreakpoints.of(context).equals(MOBILE) ||
                  ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
                Scaffold.of(context).closeDrawer();
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "Assets.iconSettingIcon",
                  color: Colors.black,
                  width: 22,
                  height: 22,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Setting',
                  style: context.theme.textTheme.labelLarge!.copyWith(
                    fontSize: 20.sp,
                    letterSpacing: .5,
                    color: const Color(0xff292929),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
