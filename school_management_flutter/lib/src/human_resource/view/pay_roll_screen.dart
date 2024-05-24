import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/view/section_screen.dart';
import 'package:school_management_flutter/src/human_resource/vm/pay_roll.vm.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class PayRollScreen extends StatelessView<PayRoleVM> {
  const PayRollScreen({super.key});

  @override
  ViewModelProvider<PayRoleVM> get vm => payRoleVmProvider;

  @override
  Widget render(BuildContext context, PayRoleVM vm, ref) {
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
                              "Month",
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
                                value: vm.selectedSection,
                                onChanged: (String? newValue) {
                                  // Update the selected class
                                  vm.selectedSection = newValue!;
                                  vm.setState(() {});
                                },
                                items: vm.sectionNames
                                    .map<DropdownMenuItem<String>>(
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
                              "Year",
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
                                value: vm.selectedSection,
                                onChanged: (String? newValue) {
                                  // Update the selected class
                                  vm.selectedSection = newValue!;
                                  vm.setState(() {});
                                },
                                items: vm.sectionNames
                                    .map<DropdownMenuItem<String>>(
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
                            color:
                                Colors.black.withOpacity(0.23999999463558197),
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

                  const PayRollList(),
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

class PayRollList extends StatelessWidget {
  const PayRollList({super.key});

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
                'Department',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Designation',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Phone',
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
                          '103',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Shiwam karn',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Teacher',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Academic',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Faculty',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          '9813660129',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Generated',
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
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Proceed To Pay",
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.textColorBlack
                                              .withOpacity(.8)),
                                ))
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
