import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';

import '../../const/app_colors.dart';

class WidgetConst {
  WidgetConst._();
  static InputDecoration inputDecoration(
      {required String label, required BuildContext context}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.primaryColor,
          width: 1.w,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      labelStyle: context.theme.textTheme.titleMedium!.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorBlack),
      hintStyle: context.theme.textTheme.titleMedium!.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textColorBlack),
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
    );
  }
}

class DatePickerTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const DatePickerTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  DatePickerTextFieldState createState() => DatePickerTextFieldState();
}

class DatePickerTextFieldState extends State<DatePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: true,
        style: context.theme.textTheme.titleMedium!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorBlack),
        controller: widget.controller,
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1),
          );
          if (picked != null) {
            setState(() {
              widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
            });
          }
        },
        decoration: WidgetConst.inputDecoration(
            label: widget.labelText, context: context),
      ),
    );
  }
}
