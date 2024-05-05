import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/src/dashboard/widget/full_side_bar.dart';
import 'package:school_management_flutter/utils/connectivity_util.dart';
import 'package:window_manager/window_manager.dart';

import '../../../auth/model/permission_model.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.f11, control: true): () async {
          fullScreen = !fullScreen;
          await windowManager.setFullScreen(fullScreen);
        },
        const SingleActivator(LogicalKeyboardKey.keyF, control: true):
            () async {
          fullScreen = !fullScreen;
          await windowManager.setFullScreen(fullScreen);
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            drawer: getFullSideBar(),
            appBar: PreferredSize(
              preferredSize: Size(
                  MediaQuery.of(context).size.width,
                  ResponsiveBreakpoints.of(context).isTablet ||
                          ResponsiveBreakpoints.of(context).isMobile
                      ? 45
                      : 56),
              child: AppBar(
                elevation: 0,
                leading: Builder(builder: (context) {
                  return ResponsiveValue(
                    context,
                    conditionalValues: [
                      Condition.smallerThan(
                          name: DESKTOP,
                          value: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.dehaze_rounded,
                              color: AppColors.btnColor,
                            ),
                          )),

                      // Condition.equals(name: DESKTOP, value: 376.w),
                    ],
                    defaultValue: SizedBox(),
                  ).value;
                }),
                backgroundColor: context.theme.canvasColor,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness:
                      Brightness.dark, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
                actions: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: const [
                            Condition.equals(name: DESKTOP)
                          ],
                          child: getAppTitleDesktop(),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     holdIcon(name: '81|82'),
                        //     SizedBox(
                        //       width: 22.w,
                        //     ),
                        //     holdIcon(name: 'BS'),
                        //     SizedBox(
                        //       width: 22.w,
                        //     ),
                        //     SvgPicture.asset(
                        //       " Assets.iconNotification",
                        //       color: Color(0xFF838383),
                        //       width: 34.w,
                        //       height: 36.h,
                        //     ),
                        //     SizedBox(
                        //       width: 80.w,
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: Container(
                        //         color: AppColors.transparent,
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               width: 34,
                        //               height: 34,
                        //               alignment: Alignment.center,
                        //               decoration: const BoxDecoration(
                        //                 color: Color(0xFFD9D9D9),
                        //                 shape: BoxShape.circle,
                        //               ),
                        //               child: Text(
                        //                   "  UserConst.companyName"
                        //                       .toString()
                        //                       .split('')
                        //                       .first,
                        //                   style: TextStyle(fontSize: 16.sp)),
                        //             ),
                        //             SizedBox(
                        //               width: 20.w,
                        //             ),
                        //             Text(
                        //               " UserConst.companyName.toString()",
                        //               maxLines: 1,
                        //               overflow: TextOverflow.ellipsis,
                        //               style: context
                        //                   .theme.textTheme.titleMedium!
                        //                   .copyWith(
                        //                 color: Color(0xFF606060),
                        //                 fontSize: 22.sp,
                        //                 fontFamily: 'SF Pro Display',
                        //                 fontWeight: FontWeight.w600,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 20.w,
                        //             ),
                        //             SvgPicture.asset(
                        //               " Assets.iconDropdownIcon",
                        //               color: Color(0xFF606060),
                        //               width: 10,
                        //               height: 5,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 22.w,
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: body()),
      ),
    );
  }

  Widget body() {
    return Row(
      children: [
        ResponsiveVisibility(
          visible: false,
          maintainState: true,
          visibleConditions: const [Condition.largerThan(name: TABLET)],
          child: getFullSideBar(),
        ),
        Expanded(
          child: ColoredBox(
              color: context.theme.scaffoldBackgroundColor,
              child: InternetStatusWidget(child: widget.child)),
        ),
      ],
    );
  }

  Widget getAppTitleDesktop() => Container(
        width: 250,
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: AppColors.canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              SvgPicture.asset(
                "",
                width: 32.w,
                height: 34.h,
                color: AppColors.btnColor,
              ),
              SizedBox(
                width: 18.w,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'School',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: AppColors.btnColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Management',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget holdIcon({
    String? iconString,
    required String name,
  }) =>
      Container(
          height: 56.h,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            name,
            style: context.theme.textTheme.titleMedium!.copyWith(
              color: Color(0xFF696969),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ));

  Widget getFullSideBar() => FullSideBar(
        child: widget.child,
      );
}

List<AdminMenuItem>? permissions = [
  AdminMenuItem(title: 'Main Options', icon: "", isHeader: true, children: []),
  AdminMenuItem(
      title: 'Dashboard', route: '/Dashboard', icon: 'assets/multidoor.svg'),
  AdminMenuItem(
    title: 'Academic',
    icon: 'assets/multidoor.svg',
    children: [
      AdminMenuItem(
        title: 'Section',
        route: '/section',
      ),
      AdminMenuItem(
        title: 'Class',
        route: '/class',
      ),
      AdminMenuItem(
        title: 'Subject',
        route: '/subject',
      ),
      AdminMenuItem(
        title: 'Subject Group',
        route: '/SubjectGroup',
      ),
      AdminMenuItem(
        title: 'Promote Student',
        route: '/promoteStudent',
      ),
      AdminMenuItem(
        title: 'Assign Class Teacher',
        route: '/assignClassTeacher',
      ),
      AdminMenuItem(
        title: 'Teacher TimeTable',
        route: '/teacherTimeTable',
      ),
      AdminMenuItem(
        title: 'Class TimeTable',
        route: '/classTimeTable',
      ),
    ],
  )
];
