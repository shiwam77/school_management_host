import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_management_flutter/auth/model/permission_model.dart';
import 'package:school_management_flutter/src/dashboard/view/dashboard.dart';

ValueNotifier<int> tileIndex = ValueNotifier(-1);
// int selectedIndexExpansionTile = -1;

class SideBarItem extends StatefulWidget {
  const SideBarItem(
      {super.key,
      required this.items,
      required this.index,
      this.onSelected,
      required this.selectedRoute,
      this.depth = 0,
      this.iconColor,
      this.activeIconColor,
      required this.textStyle,
      required this.activeTextStyle,
      required this.backgroundColor,
      required this.activeBackgroundColor,
      required this.borderColor,
      this.isHeader = false,
      required this.parentIndex});

  final List<AdminMenuItem> items;
  final int index;
  final int parentIndex;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;
  final bool? isHeader;

  @override
  State<SideBarItem> createState() => _SideBarItemState();
}

class _SideBarItemState extends State<SideBarItem> {
  bool get isLast => widget.index == widget.items.length - 1;
  var _hovered = false;

  int selectedTile = -1;

  void _onEnteredCellZone() {
    setState(() => _hovered = true);
  }

  void _onExitCellZone() {
    setState(() => _hovered = false);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.depth > 0 && isLast) {
      return _buildTiles(context, widget.items[widget.index]);
    }
    return Container(
      child: _buildTiles(context, widget.items[widget.index]),
    );
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(widget.selectedRoute, [item]);

    if (item.isHeader != null && item.isHeader == true) {
      return Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 5),
        child: Text(
          item.title.toString(),
          style: const TextStyle(
            color: Color(0xFF686868),
            fontSize: 12,
            letterSpacing: .5,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }

    if (item.children!.isEmpty) {
      return MouseRegion(
        onEnter: (_) => _onEnteredCellZone(),
        onExit: (_) => _onExitCellZone(),
        cursor: SystemMouseCursors.click,
        child: Container(
          color: _hovered ? Colors.grey.withOpacity(.5) : Colors.transparent,
          child: ListTile(
            contentPadding: _getTilePadding(widget.depth),
            minLeadingWidth: 30,
            visualDensity: const VisualDensity(vertical: -4),
            leading: _buildIcon(item.icon, selected),
            title: _buildTitle(item.title!, selected),
            selected: selected,
            tileColor: widget.backgroundColor,
            onTap: () {
              if (widget.onSelected != null) {
                widget.onSelected!(item);
                subSelected.forEach((key, value) {
                  subSelected = {key: false};
                });
                subSelected = {widget.parentIndex: true};
              }
            },
          ),
        ),
      );
    }

    int index = 0;
    final childrenTiles = item.children!.map((child) {
      return SideBarItem(
        items: item.children!,
        index: index++,
        parentIndex: widget.parentIndex,
        onSelected: widget.onSelected,
        selectedRoute: widget.selectedRoute,
        depth: widget.depth + 1,
        iconColor: widget.iconColor,
        activeIconColor: widget.activeIconColor,
        textStyle: widget.textStyle,
        activeTextStyle: widget.activeTextStyle,
        backgroundColor: widget.backgroundColor,
        activeBackgroundColor: widget.activeBackgroundColor,
        borderColor: widget.borderColor,
      );
    }).toList();

    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        minLeadingWidth: 20,
        child: CustomExpansionTile(
          maintainState: true,
          tilePadding: _getTilePadding(widget.depth),
          backgroundColor: widget.backgroundColor,
          collapsedBackgroundColor: widget.backgroundColor,
          leading: _buildIcon(item.icon),
          title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: _buildTitle(item.title.toString()),
          ),
          initiallyExpanded: selectedTile == widget.parentIndex,
          iconColor: widget.activeIconColor,
          collapsedIconColor: widget.iconColor,
          index: widget.parentIndex,
          children: childrenTiles,
        ),
      ),
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children!.isNotEmpty) {
        return _isSelected(route, item.children!);
      }
    }
    return false;
  }

  Widget _buildIcon(String? icon, [bool selected = false]) {
    return icon != null
        ? Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              alignment: Alignment.center,
              color: selected
                  ? widget.activeIconColor ?? widget.activeTextStyle.color
                  : widget.iconColor ?? widget.textStyle.color,
            ),
          )
        : const SizedBox();
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(
      title,
      style: selected ? widget.activeTextStyle : widget.textStyle,
    );
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + (depth == 0 ? 10.0 : 4) * depth,
      right: 10.0,
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final int index;

  const CustomExpansionTile(
      {Key? key,
      required this.index,
      this.leading,
      required this.title,
      this.subtitle,
      required this.children,
      this.backgroundColor,
      this.collapsedBackgroundColor,
      this.trailing,
      required this.initiallyExpanded,
      required this.maintainState,
      this.tilePadding,
      this.expandedAlignment,
      this.expandedCrossAxisAlignment,
      this.childrenPadding,
      this.iconColor,
      this.collapsedIconColor,
      this.textColor,
      this.collapsedTextColor,
      this.shape,
      this.collapsedShape,
      this.clipBehavior,
      this.controller})
      : super(key: key);

  final Widget? leading;

  final Widget title;

  final Widget? subtitle;

  final List<Widget> children;

  final Color? backgroundColor;

  final Color? collapsedBackgroundColor;

  final Widget? trailing;

  final bool initiallyExpanded;

  final bool maintainState;

  final EdgeInsetsGeometry? tilePadding;

  final Alignment? expandedAlignment;

  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final EdgeInsetsGeometry? childrenPadding;

  final Color? iconColor;

  final Color? collapsedIconColor;

  final Color? textColor;

  final Color? collapsedTextColor;

  final ShapeBorder? shape;

  final ShapeBorder? collapsedShape;

  final Clip? clipBehavior;

  final ExpansionTileController? controller;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, child) {
        return ExpansionTile(
            key: Key(tileIndex.value.toString()),
            maintainState: true,
            tilePadding: widget.tilePadding,
            backgroundColor: widget.backgroundColor,
            collapsedBackgroundColor: widget.backgroundColor,
            leading: widget.leading,
            title: widget.title,
            initiallyExpanded: tileIndex.value == widget.index,
            iconColor: widget.iconColor,
            collapsedIconColor: widget.collapsedIconColor,
            onExpansionChanged: (newState) {
              tileIndex.value = widget.index;
            },
            children: widget.children);
      },
      valueListenable: tileIndex,
    );
  }
}
