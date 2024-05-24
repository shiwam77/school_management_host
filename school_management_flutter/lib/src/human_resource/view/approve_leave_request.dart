import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/human_resource/vm/approve_leave_request.vm.dart';
import 'package:school_management_flutter/src/human_resource/widget.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

import '../../../_internal/components/spacing.dart';
import '../../academics/view/section_screen.dart';

class ApproveLeaveRequestScreen extends StatelessView<ApproveLeaveRequestVM> {
  const ApproveLeaveRequestScreen({super.key});

  @override
  ViewModelProvider<ApproveLeaveRequestVM> get vm =>
      approveLeaveRequestVmProvider;

  @override
  Widget render(BuildContext context, ApproveLeaveRequestVM vm, ref) {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Approve Leave Request',
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBlack),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showApproveLeaveDialog(context);
                      },
                      child: Text(
                        'Add Leave Request',
                        style: context.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorBlack),
                      ),
                    ),
                  ],
                ),
                const VSpace(12),
                const Divider(
                  thickness: .5,
                ),
                const VSpace(12),
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
                    ),
                  ),
                ),
                const VSpace(12),
                const LeaveList(),
                // const StudentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showApproveLeaveDialog(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    TextEditingController reasonController = TextEditingController();

    String? selectedLeaveType;
    String? selectedStaffName;
    String? selectedRole;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
              ),
              backgroundColor: AppColors.canvasColor,
              title: const Text('Leave Application'),
              content: SizedBox(
                width: 800,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border: Border.all(
                                      color: Colors.black
                                          .withOpacity(0.23999999463558197))),
                              child: Theme(
                                data: ThemeData().copyWith(
                                    dividerColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                  hint: Text(
                                    "Select Role",
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColorBlack),
                                  ),
                                  underline: const SizedBox.shrink(),
                                  value: selectedRole,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedRole = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Admin',
                                    'Teacher',
                                    'Super Admin'
                                  ].map<DropdownMenuItem<String>>(
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
                                                color:
                                                    AppColors.textColorBlack),
                                      ),
                                    );
                                  }).toList(),
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColorBlack),
                                ),
                              ),
                            ),
                          ),
                          const HSpace(12),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border: Border.all(
                                      color: Colors.black
                                          .withOpacity(0.23999999463558197))),
                              child: Theme(
                                data: ThemeData().copyWith(
                                    dividerColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                  hint: Text(
                                    "Select Staff Name",
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColorBlack),
                                  ),
                                  underline: const SizedBox.shrink(),
                                  value: selectedStaffName,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedStaffName = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Shiwam (102)',
                                    'Bibek (103)',
                                    'Ravi (104)'
                                  ].map<DropdownMenuItem<String>>(
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
                                                color:
                                                    AppColors.textColorBlack),
                                      ),
                                    );
                                  }).toList(),
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColorBlack),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VSpace(20),
                      Row(
                        children: [
                          Expanded(
                            child: DatePickerTextField(
                              labelText: 'Apply Date',
                              controller: TextEditingController(
                                text: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now()),
                              ),
                            ),
                          ),
                          const HSpace(12),
                          Expanded(
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  border: Border.all(
                                      color: Colors.black
                                          .withOpacity(0.23999999463558197))),
                              child: Theme(
                                data: ThemeData().copyWith(
                                    dividerColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                  hint: Text(
                                    "Select Available Leave",
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColorBlack),
                                  ),
                                  underline: const SizedBox.shrink(),
                                  value: selectedLeaveType,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedLeaveType = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Sick Leave',
                                    'Vacation Leave',
                                    'Personal Leave'
                                  ].map<DropdownMenuItem<String>>(
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
                                                color:
                                                    AppColors.textColorBlack),
                                      ),
                                    );
                                  }).toList(),
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColorBlack),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const VSpace(20),
                      Row(
                        children: [
                          Expanded(
                            child: DatePickerTextField(
                              labelText: 'Leave From Date',
                              controller: fromDateController,
                            ),
                          ),
                          const HSpace(12),
                          Expanded(
                            child: DatePickerTextField(
                              labelText: 'Leave To Date',
                              controller: toDateController,
                            ),
                          ),
                        ],
                      ),
                      const VSpace(20),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: reasonController,
                              maxLines: 3,
                              decoration: WidgetConst.inputDecoration(
                                  label: 'Reason', context: context),
                            ),
                          ),
                          const HSpace(12),
                          Expanded(
                            child: TextField(
                              controller: reasonController,
                              maxLines: 3,
                              decoration: WidgetConst.inputDecoration(
                                  label: 'Note', context: context),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // FilePickerResult? result =
                          //     await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          //   // Handle file selection
                          // }
                        },
                        child: Text('Attach Document',
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack)),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add leave application logic here
                    Navigator.of(context).pop();
                  },
                  child: Text('Apply',
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBlack)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class LeaveList extends StatelessWidget {
  const LeaveList({super.key});

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
            columnSpacing: 70.w,
            columns: [
              DataColumn(
                  label: Text(
                'Staff',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Leave Type',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Leave Date',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Days',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Apply Date',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Status',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Action',
                style: headerStyle,
              )),
            ],
            rows: [
              ...List.generate(
                  5,
                  (index) => DataRow(cells: [
                        DataCell(Text(
                          'Joe Black',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Medical Leave',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          '03/15/2024 - 03/17/2024',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          '03',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          '03/15/2024',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Pending',
                          style: rowStyle,
                        )),
                        DataCell(Row(
                          children: [
                            iconButton(
                              icon: Icons.remove_red_eye,
                              onPressed: () {
                                // Handle delete action
                              },
                            ),
                            iconButton(
                              icon: Icons.delete,
                              iconColor: Colors.red,
                              onPressed: () {
                                // Handle delete action
                              },
                            ),
                          ],
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
