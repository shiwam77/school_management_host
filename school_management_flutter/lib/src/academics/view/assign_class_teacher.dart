import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/view/section_screen.dart';
import 'package:school_management_flutter/src/academics/vm/assign_teacher.vm.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class AssignTeacher extends StatelessView<AssignTeacherVM> {
  const AssignTeacher({super.key});

  @override
  ViewModelProvider<AssignTeacherVM> get vm => assignTeacherVmProvider;

  @override
  Widget render(BuildContext context, AssignTeacherVM vm, ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.canvasColor,
                  borderRadius: Corners.s10Border,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: AssignTeacherView(
                    vm: vm,
                  ),
                ),
              ),
            ),
            const HSpace(20),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.canvasColor,
                  borderRadius: Corners.s10Border,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: ClassTeacherList(
                    vm: vm,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignTeacherView extends StatelessWidget {
  final AssignTeacherVM vm;
  const AssignTeacherView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Assign Class Teacher',
            style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack),
          ),
          const VSpace(20),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(
                    color: Colors.black.withOpacity(0.23999999463558197))),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: vm.selectedClass,
              onChanged: (String? newValue) {
                // Update the selected class
                vm.selectedClass = newValue!;
                vm.setState(() {});
              },
              items: vm.classes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorBlack),
                  ),
                );
              }).toList(),
            ),
          ),
          const VSpace(20),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(
                    color: Colors.black.withOpacity(0.23999999463558197))),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox.shrink(),
              value: vm.selectedSection,
              onChanged: (String? newValue) {
                // Update the selected class
                vm.selectedSection = newValue!;
                vm.setState(() {});
              },
              items:
                  vm.sectionNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorBlack),
                  ),
                );
              }).toList(),
            ),
          ),
          const VSpace(20),
          RichText(
            text: TextSpan(
              text: 'Class Teacher ',
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorBlack),
              children: [
                TextSpan(
                  text: '*',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          const VSpace(20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: vm.teacher.length,
            itemBuilder: (context, index) {
              final sectionName = vm.teacher[index];
              return CheckboxListTile(
                title: Text(
                  sectionName,
                  style: context.theme.textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorBlack),
                ),
                activeColor: Colors.white, // Set to white
                checkColor: Colors.white, // Set to white
                fillColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      // If the checkbox is checked, return white
                      return AppColors.btnColor;
                    }
                    // Otherwise, return null (default fill color)
                    return Colors.white;
                  },
                ),
                value: vm.selectedTeacher
                    .contains(sectionName), // Set the initial value as needed
                onChanged: (bool? value) {
                  if (value != null) {
                    if (value) {
                      // Checkbox is checked, add the section to the selectedSections list
                      vm.selectedTeacher.add(sectionName);
                    } else {
                      // Checkbox is unchecked, remove the section from the selectedSections list
                      vm.selectedTeacher.remove(sectionName);
                    }
                    vm.setState(() {});
                  }
                },
              );
            },
          ),
          const VSpace(20),
          const VSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Handle save button tap
                },
                child: Text(
                  'Save',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorBlack),
                ),
              ),
            ],
          ),
          const VSpace(20),
        ],
      ),
    );
  }
}

class ClassTeacherList extends StatelessWidget {
  final AssignTeacherVM vm;
  const ClassTeacherList({super.key, required this.vm});

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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Class Teacher List',
            style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40, // Set the desired height for the TextField
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
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 90.w,
              dataRowMaxHeight: 100,
              columns: [
                DataColumn(
                    label: Text(
                  'Class',
                  style: headerStyle,
                )),
                DataColumn(
                    label: Text(
                  'Section',
                  style: headerStyle,
                )),
                DataColumn(
                    label: Text(
                  'Class Teacher',
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
                            'Class $index',
                            style: rowStyle,
                          )),
                          DataCell(Text(
                            'A',
                            style: rowStyle,
                          )),
                          DataCell(SizedBox(
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListView.builder(
                                  itemCount: 10,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      'Shiwam Karn',
                                      textAlign: TextAlign.center,
                                      style: rowStyle,
                                    );
                                  }),
                            ),
                          )),
                          DataCell(Row(
                            children: [
                              iconButton(
                                icon: Icons.edit,
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
      ),
    );
  }
}
