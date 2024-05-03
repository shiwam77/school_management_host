import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';

class ContinueWithButton extends StatelessWidget {
  final String label;
  final String iconSvg;
  final Function? onTap;
  const ContinueWithButton(
      {super.key, required this.label, this.onTap, required this.iconSvg});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 57.h,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50.w, color: AppColors.btnColor),
            borderRadius: BorderRadius.circular(11.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 25.h,
              width: 25.w,
              child: SvgPicture.asset(
                iconSvg,
                height: 25.h,
                width: 25.w,
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(
              label,
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontSize: 20,
                color: const Color(0xFF757575),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
