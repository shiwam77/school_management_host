import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';

class RectangularTextField extends StatelessWidget {
  final IconData? prefixIconData;
  final TextEditingController? controller;
  final String label;
  final bool? required;
  final Function? onChange;
  final Function? validator;
  final bool isError;
  final int? maxLength;
  final String? hintText;
  final String? suffix;
  final bool? readOnly;
  final bool? hasPrefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Function? onTap;
  final Color? color;
  final bool? isPrimary;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const RectangularTextField(
      {super.key,
      this.prefixIconData,
      this.controller,
      this.onChange,
      required this.label,
      this.required = false,
      this.readOnly = false,
      this.obscureText = false,
      this.hintText,
      this.maxLength,
      required this.isError,
      this.keyboardType,
      this.onTap,
      this.suffix,
      this.hasPrefixIcon = true,
      this.validator,
      this.suffixIcon,
      this.isPrimary = true,
      this.color,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: context.theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
            ),
            children: [
              TextSpan(
                text: label,
              ),
              if (required == true)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red), // Red asterisk
                ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          onTap: () {
            if (readOnly == true) {
              onTap!();
            }
          },
          textAlignVertical: TextAlignVertical.center,
          maxLength: maxLength,
          maxLines: 1,
          expands: false,
          readOnly: readOnly!,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscureText as bool,
          inputFormatters: [...inputFormatters ?? []],
          onChanged: (value) {},
          validator: (value) {
            return validator!(value);
          },
          style: context.theme.textTheme.titleMedium!.copyWith(
              color: AppColors.textColorBlack,
              fontSize: 18.sp,
              letterSpacing: 0.5),
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            isDense: false,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.only(left: 20.w, right: 30.w),
            // contentPadding: isPrimary == true
            //     ? EdgeInsets.symmetric(vertical: 15, horizontal: 30.w)
            //     : EdgeInsets.only(
            //         top: context.responsive(20,
            //             sm: 10, md: 10, xl: 15, lg: 15)),
            isCollapsed: false,
            hintText: hintText,
            filled: true,
            fillColor: Colors.white.withOpacity(0.9333333373069763),
            errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal),
            hintStyle: context.theme.textTheme.titleMedium!.copyWith(
              color: const Color(0xFF838383),
              fontSize: 18.sp,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.primaryColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.theme.primaryColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.23999999463558197),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
          ),
        ),
      ],
    );
  }
}
