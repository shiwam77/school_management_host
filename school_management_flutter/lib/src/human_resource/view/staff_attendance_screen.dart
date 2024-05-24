import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/human_resource/vm/staff_attendance.vm.dart';
import 'package:school_management_flutter/src/human_resource/widget.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class StaffAttendanceScreen extends StatelessView<StaffAttendanceVM> {
  const StaffAttendanceScreen({super.key});

  @override
  ViewModelProvider<StaffAttendanceVM> get vm => staffAttendanceVmProvider;

  @override
  Widget render(BuildContext context, StaffAttendanceVM vm, ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius: Corners.s10Border,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Criteria',
                    style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorBlack),
                  ),
                  const VSpace(12),
                  const Divider(
                    thickness: .5,
                  ),
                  const VSpace(12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Role",
                              textAlign: TextAlign.start,
                              style: context.theme.textTheme.titleMedium!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColorBlack),
                            ),
                            const VSpace(12),
                            Container(
                              height: 35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border: Border.all(
                                      color: Colors.black
                                          .withOpacity(0.23999999463558197))),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                value: vm.selectedClass,
                                onChanged: (String? newValue) {
                                  // Update the selected class
                                  vm.selectedClass = newValue!;
                                  vm.setState(() {});
                                },
                                items: vm.classes.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: context
                                          .theme.textTheme.titleMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textColorBlack),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HSpace(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: context.theme.textTheme.titleMedium!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColorBlack),
                            ),
                            const VSpace(12),
                            DatePickerTextField(
                              labelText: 'Attendance Date',
                              controller: TextEditingController(
                                text: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Handle save button tap
                        },
                        child: Text(
                          'Search',
                          style: context.theme.textTheme.titleMedium!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorBlack),
                        ),
                      ),
                    ],
                  ),

                  const VSpace(12),
                  Text(
                    'Staff List',
                    style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorBlack),
                  ),
                  const VSpace(5),
                  const Divider(
                    thickness: .5,
                  ),
                  const VSpace(12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Set attendance for all Staff as ',
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textColorBlack),
                          ),
                          const HSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 'Present',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Present',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorBlack),
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Absent',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Absent',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorBlack),
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Late',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Late',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorBlack),
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Half Day',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Half Day',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorBlack),
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'HolyDay',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'HolyDay ',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorBlack),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 200.w,
                        child: TextField(
                          style: context.theme.textTheme.titleMedium!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorBlack),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10), // Adjust vertical padding
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .blue), // Change this color to your desired color
                            ),
                            labelStyle: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                            hintStyle: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: context.theme.primaryColor,
                                width: 1.w,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black
                                    .withOpacity(0.23999999463558197),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  StaffAttendanceView(
                    vm: vm,
                  ),
                  // const StudentList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StaffAttendanceView extends StatelessWidget {
  final StaffAttendanceVM vm;
  const StaffAttendanceView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = context.theme.textTheme.titleMedium!.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorBlack);

    TextStyle rowStyle = context.theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textColorBlack.withOpacity(.8));
    return Column(
      children: [
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 50.w,
            columns: [
              DataColumn(
                  label: Text(
                'Staff ID',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Name',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Role',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Attendance',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Source',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Note',
                style: headerStyle,
              )),
            ],
            rows: [
              ...List.generate(
                  5,
                  (index) => DataRow(cells: [
                        DataCell(Text(
                          '103',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Shiwam karn',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Admin',
                          style: rowStyle,
                        )),
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 'Present',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Present',
                                style: rowStyle,
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Absent',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Absent',
                                style: rowStyle,
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Late',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Late',
                                style: rowStyle,
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'Half Day',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'Half Day',
                                style: rowStyle,
                              ),
                              const SizedBox(width: 20),
                              Radio(
                                value: 'HolyDay',
                                groupValue: vm.selectedMode,
                                onChanged: (value) {
                                  vm.setSelectedMode(value);
                                },
                              ),
                              Text(
                                'HolyDay ',
                                style: rowStyle,
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(
                          'Manual',
                          style: rowStyle,
                        )),
                        DataCell(SizedBox(
                          height: 30,
                          width: 150,
                          child: TextField(
                            maxLines: 1,
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                            decoration: WidgetConst.inputDecoration(
                                label: 'Note', context: context),
                          ),
                        )),
                      ])),

              // Add mo
            ],
          ),
        ),
        const VSpace(20),
      ],
    );
  }
}
