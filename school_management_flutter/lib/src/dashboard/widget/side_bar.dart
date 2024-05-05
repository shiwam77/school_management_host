import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_flutter/auth/model/permission_model.dart';
import 'package:school_management_flutter/const/app_colors.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';

import 'side_bar_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.items,
    required this.selectedRoute,
    this.onSelected,
    this.width = 240.0,
    this.iconColor,
    this.activeIconColor,
    this.textStyle = const TextStyle(
      color: Color(0xFF337ab7),
      fontSize: 12,
    ),
    this.activeTextStyle = const TextStyle(
      color: Color(0xFF337ab7),
      fontSize: 12,
    ),
    this.backgroundColor = AppColors.canvasColor,
    this.activeBackgroundColor = const Color(0xFFE7E7E7),
    this.borderColor = const Color(0xFFE7E7E7),
    this.scrollController,
    this.header,
    this.footer,
  }) : super(key: key);

  final List<AdminMenuItem> items;
  final String selectedRoute;
  final void Function(AdminMenuItem item)? onSelected;
  final double width;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;
  final ScrollController? scrollController;
  final Widget? header;
  final Widget? footer;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late double _sideBarWidth;
  late Widget _child;
  int selectedTile = -1;

  @override
  void initState() {
    super.initState();
    _sideBarWidth = widget.width;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    _sideBarWidth = min(mediaQuery.size.width * 0.7, widget.width);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.canvasColor,
      ),
      width: _sideBarWidth,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          if (widget.header != null) widget.header!,
          SizedBox(
            height: MediaQuery.of(context).size.height - 200.h,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SideBarItem(
                  items: widget.items,
                  index: index,
                  onSelected: widget.onSelected,
                  selectedRoute: widget.selectedRoute,
                  depth: 0,
                  iconColor: widget.iconColor,
                  activeIconColor: widget.activeIconColor,
                  textStyle: widget.textStyle,
                  activeTextStyle: widget.activeTextStyle,
                  backgroundColor: widget.backgroundColor,
                  activeBackgroundColor: widget.activeBackgroundColor,
                  borderColor: widget.borderColor,
                  parentIndex: index,
                );
              },
              itemCount: widget.items.length,
              controller: widget.scrollController ?? ScrollController(),
            ),
          ),
          const Spacer(),
          if (widget.footer != null) widget.footer!,
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
