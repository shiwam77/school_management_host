import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/const/app_image.dart';

class AuthBodyView extends StatelessWidget {
  final Widget child;
  const AuthBodyView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: child),
        Expanded(
            flex: 1,
            child: Container(
                color: AppColors.bgCyan,
                alignment: Alignment.center,
                child: SvgPicture.asset(AppImage.loginAsset))),
      ],
    );
  }
}
