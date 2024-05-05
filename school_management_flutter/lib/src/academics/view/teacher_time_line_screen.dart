import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/vm/teacher_time_table.vm.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class TeacherTimeTableScreen extends StatelessView<TeacherTimeTableVM> {
  const TeacherTimeTableScreen({super.key});

  @override
  ViewModelProvider<TeacherTimeTableVM> get vm => teacherTimeTableVmProvider;

  @override
  Widget render(BuildContext context, TeacherTimeTableVM vm, ref) {
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
                  'Teacher Time Table',
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
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Teachers *",
                            textAlign: TextAlign.start,
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColorBlack),
                          ),
                          const VSpace(12),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(
                                              0.23999999463558197))),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    value: vm.selectedTeacher,
                                    onChanged: (String? newValue) {
                                      // Update the selected class
                                      vm.selectedTeacher = newValue!;
                                      vm.setState(() {});
                                    },
                                    items: vm.teachers
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
                                                  color:
                                                      AppColors.textColorBlack),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const HSpace(20),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle save button tap
                                },
                                child: Text(
                                  'Search',
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColorBlack),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
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
