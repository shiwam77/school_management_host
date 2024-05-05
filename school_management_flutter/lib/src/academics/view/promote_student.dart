import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/vm/promote_student.vm.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

import '../../../styles.dart';

class PromoteStudentScreen extends StatelessView<PromoteStudentVM> {
  const PromoteStudentScreen({super.key});

  @override
  ViewModelProvider<PromoteStudentVM> get vm => promoteStudentVmProvider;

  @override
  Widget render(BuildContext context, PromoteStudentVM vm, ref) {
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
                            "Class",
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: context.theme.textTheme.titleMedium!
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
                            "Section",
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                          ),
                          VSpace(12),
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: context.theme.textTheme.titleMedium!
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
                const VSpace(20),
                Text(
                  'Promote Students In Next Session',
                  style: context.theme.textTheme.titleSmall!.copyWith(
                      fontSize: 20.sp, color: AppColors.textColorBlack),
                ),
                const VSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Promote In Session",
                            textAlign: TextAlign.start,
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                          ),
                          VSpace(12),
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                border: Border.all(
                                    color: Colors.black
                                        .withOpacity(0.23999999463558197))),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox.shrink(),
                              value: vm.selectedSession,
                              onChanged: (String? newValue) {
                                // Update the selected class
                                vm.selectedSession = newValue!;
                                vm.setState(() {});
                              },
                              items: vm.session.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: context.theme.textTheme.titleMedium!
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
                    HSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Class",
                            textAlign: TextAlign.start,
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                          ),
                          VSpace(12),
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: context.theme.textTheme.titleMedium!
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
                    HSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Section",
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                          ),
                          VSpace(12),
                          Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: context.theme.textTheme.titleMedium!
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
                        'Search',
                        style: context.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorBlack),
                      ),
                    ),
                  ],
                ),
                const VSpace(20),
                Text(
                  'Students',
                  style: context.theme.textTheme.titleMedium!.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorBlack),
                ),
                const VSpace(12),
                const Divider(
                  thickness: .5,
                ),
                // const StudentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class StudentList extends StatelessWidget {
//   const StudentList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const ListVi;
//   }
// }
