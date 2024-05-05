import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';

class CustomDropdown extends StatelessWidget {
  String? dropDownValue;
  List<String>? list;
  Function? onChange;
  final double? width;
  final Color? bgColor;
  CustomDropdown(
      {this.width, this.list, this.onChange, this.dropDownValue, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        focusColor: Colors.green.withOpacity(0.4),
      ),
      child: Container(
        width: width ?? 163.w,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: bgColor ?? Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.23999999463558197),
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: DropdownButton<String>(
          value: dropDownValue ?? 'Filter',
          iconEnabledColor: Colors.white,
          hint: Text(dropDownValue.toString()),
          isExpanded: true,
          alignment: Alignment.centerLeft,
          style: context.theme.textTheme.titleMedium!.copyWith(
            fontSize: 20.sp,
            color: Color(0xFF5D5D5D),
          ),
          dropdownColor: context.theme.scaffoldBackgroundColor,
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF5D5D5D)),
          iconSize: 24.0,
          underline: SizedBox.shrink(),
          elevation: dropDownValue == null ? 0 : 2,
          onChanged: (String? newValue) {
            onChange!(newValue);
          },
          onTap: () {},
          items: list!.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: context.theme.textTheme.titleMedium!.copyWith(
                    fontSize: 20.sp,
                    color: Color(0xFF5D5D5D),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
