import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/_internal/components/mouse_hover_builder.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/academics/vm/section.vm.dart';
import 'package:school_management_flutter/styles.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SectionScreen extends StatelessView<SectionVM> {
  const SectionScreen({super.key});

  @override
  ViewModelProvider<SectionVM> get vm => sectionVmProvider;

  @override
  Widget render(BuildContext context, SectionVM vm, ref) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Section',
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBlack),
                    ),
                    const VSpace(20),
                    TextField(
                      style: context.theme.textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColorBlack),
                      decoration: InputDecoration(
                        labelText: 'Section Title',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.primaryColor,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
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
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Title Section List',
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
                              color:
                                  Colors.black.withOpacity(0.23999999463558197),
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
                    const SizedBox(height: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MouseHoverBuilder(
                          isClickable: false,
                          builder: (BuildContext context, bool _hovered) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                color: _hovered
                                    ? Colors.grey.withOpacity(.5)
                                    : Colors.transparent,
                                child: ListTile(
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                  title: Text(
                                    'Section Name $index',
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColorBlack),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 17,
                                        ),
                                        onPressed: () {
                                          // Handle edit icon tap
                                        },
                                      ),
                                      iconButton(
                                        icon: Icons.delete,
                                        iconColor: Colors.red,
                                        onPressed: () {
                                          // Handle edit icon tap
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: 6, // Replace with your actual item count
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '1',
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
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
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

IconButton iconButton(
    {VoidCallback? onPressed,
    Color? iconColor,
    IconData? icon,
    double iconSize = 17}) {
  return IconButton(
    icon: Icon(
      icon,
      size: iconSize,
      color: iconColor,
    ),
    onPressed: onPressed,
  );
}
