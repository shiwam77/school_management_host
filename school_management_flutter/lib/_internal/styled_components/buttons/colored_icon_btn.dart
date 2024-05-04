import 'package:flutter/material.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/base_styled_button.dart';
import 'package:school_management_flutter/_internal/styled_components/styled_image_icon.dart';
import 'package:school_management_flutter/_internal/utils/color_utils.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/styles.dart';

/// ////////////////////////////////////////////////////
/// Transparent icon button that changes it's btn color on mouse-over
/// ////////////////////////////////////////////////////
class ColorShiftIconBtn extends StatelessWidget {
  final VoidCallback? onPressed;

  final AssetImage icon;
  final double size;
  final Color? color;
  final Color? bgColor;
  final EdgeInsets padding;
  final double? minWidth;
  final double? minHeight;
  final void Function(bool)? onFocusChanged;
  final bool shrinkWrap;

  const ColorShiftIconBtn(
    this.icon, {
    Key? key,
    this.onPressed,
    this.color,
    this.size = 22,
    this.padding = const EdgeInsets.all(Insets.sm),
    this.onFocusChanged,
    this.bgColor,
    this.minWidth,
    this.minHeight,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _mouseOver = false;
    return StatefulBuilder(
      builder: (_, setState) {
        Color iconColor = (color ?? context.theme.primaryColor);
        if (_mouseOver) {
          iconColor = ColorUtils.shiftHsl(iconColor, -.2);
        }
        return MouseRegion(
          onEnter: (_) => setState(() => _mouseOver = true),
          onExit: (_) => setState(() => _mouseOver = false),
          child: BaseStyledBtn(
              minHeight: minHeight ?? (shrinkWrap ? 0 : 42),
              minWidth: minWidth ?? (shrinkWrap ? 0 : 42),
              bgColor: bgColor ?? Colors.transparent,
              downColor: const Color(0xffc1dcbc).withOpacity(.35),
              hoverColor: bgColor ?? Colors.transparent,
              onFocusChanged: onFocusChanged,
              contentPadding: padding,
              onPressed: onPressed,
              child: IgnorePointer(
                child: StyledImageIcon(icon, size: size, color: iconColor),
              )),
        );
      },
    );
  }
}
