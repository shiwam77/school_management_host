import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/view/section_screen.dart';
import 'package:school_management_flutter/src/academics/vm/subject.vm.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SubjectScreen extends StatelessView<SubjectVM> {
  const SubjectScreen({super.key});

  @override
  ViewModelProvider<SubjectVM> get vm => subjectVmProvider;

  @override
  Widget render(BuildContext context, SubjectVM vm, ref) {
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
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: CreateSubjectView(
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
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: SubjectListView(
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

class CreateSubjectView extends StatelessWidget {
  final SubjectVM vm;
  const CreateSubjectView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Add Subject',
          style: context.theme.textTheme.titleMedium!.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textColorBlack),
        ),
        const VSpace(20),
        SizedBox(
          height: 40,
          child: TextField(
            style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack),
            decoration: InputDecoration(
              labelText: 'Subject Name',
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
            ),
          ),
        ),
        const VSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 'Theory',
              groupValue: vm.selectedMode,
              onChanged: (value) {
                vm.setSelectedMode(value);
              },
            ),
            Text(
              'Theory',
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorBlack),
            ),
            const SizedBox(width: 20),
            Radio(
              value: 'Practical',
              groupValue: vm.selectedMode,
              onChanged: (value) {
                vm.setSelectedMode(value);
              },
            ),
            Text(
              'Practical',
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorBlack),
            ),
          ],
        ),
        const VSpace(20),
        SizedBox(
          height: 40,
          child: TextField(
            style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack),
            decoration: InputDecoration(
              labelText: 'Subject Code',
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
            ),
          ),
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
    );
  }
}

class SubjectListView extends StatelessWidget {
  final SubjectVM vm;
  const SubjectListView({super.key, required this.vm});

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Subject List',
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
              prefixIcon: Icon(Icons.search),
              hintText: 'Search...',
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10), // Adjust vertical padding
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        Colors.blue), // Change this color to your desired color
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
            columns: [
              DataColumn(
                  label: Text(
                'Subject',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Subject Code',
                style: headerStyle,
              )),
              DataColumn(
                  label: Text(
                'Subject Type',
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
                          'Math',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'MAT101',
                          style: rowStyle,
                        )),
                        DataCell(Text(
                          'Core',
                          style: rowStyle,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Records: 1 to 5 of 5',
              style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorBlack),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    // Handle previous page
                  },
                ),
                const HSpace(6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '1',
                    style: context.theme.textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColorBlack),
                  ),
                ),
                const HSpace(6),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    // Handle next page
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
