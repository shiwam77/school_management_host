import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/view/section_screen.dart';
import 'package:school_management_flutter/src/student_information/vm/student_category.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class StudentCategoryScreen extends StatelessView<StudentCategoryVM> {
  const StudentCategoryScreen({super.key});

  @override
  ViewModelProvider<StudentCategoryVM> get vm => studentCategoryVmProvider;

  @override
  Widget render(BuildContext context, StudentCategoryVM vm, ref) {
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
                  child: CreateStCategoryView(
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
                  child: StCategoryListView(
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

class CreateStCategoryView extends StatelessWidget {
  final StudentCategoryVM vm;
  const CreateStCategoryView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Create Category',
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
              labelText: 'Category..',
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

class StCategoryListView extends StatelessWidget {
  final StudentCategoryVM vm;
  const StCategoryListView({super.key, required this.vm});

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
            'Category List',
            style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColorBlack),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 400.w,
              columns: [
                DataColumn(
                    label: Text(
                  'Category',
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
                    2,
                    (index) => DataRow(cells: [
                          DataCell(Text(
                            'Technical Head',
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
        ],
      ),
    );
  }
}
