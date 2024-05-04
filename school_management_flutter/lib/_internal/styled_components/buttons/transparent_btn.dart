import 'package:flutter/material.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/base_styled_button.dart';
import 'package:school_management_flutter/_internal/styled_components/styled_image_icon.dart';
import 'package:school_management_flutter/_internal/utils/color_utils.dart';
import 'package:school_management_flutter/styles.dart';

class TransparentBtn extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final bool bigMode;
  final EdgeInsets? contentPadding;
  final Color? bgColor;
  final Color? hoverColor;
  final Color? downColor;
  final double borderRadius;

  const TransparentBtn(
      {Key? key,
      this.onPressed,
      this.child,
      this.bigMode = false,
      this.contentPadding,
      this.bgColor,
      this.hoverColor,
      this.downColor,
      this.borderRadius = Corners.s5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStyledBtn(
      minWidth: 30,
      minHeight: 30,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: bigMode ? Insets.sm : Insets.xs,
            vertical: bigMode ? Insets.sm : Insets.xs,
          ),
      bgColor: bgColor ?? Colors.transparent,
      hoverColor: hoverColor ?? Colors.grey,
      downColor: downColor ?? ColorUtils.shiftHsl(Colors.grey, .1),
      borderRadius: borderRadius,
      child: child,
      onPressed: onPressed,
    );
  }
}

class TransparentTextBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final bool bigMode;
  final TextStyle? style;
  final Color? bgColor;

  const TransparentTextBtn(this.label,
      {Key? key,
      this.onPressed,
      this.color,
      this.bigMode = false,
      this.style,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransparentBtn(
      bigMode: bigMode,
      bgColor: bgColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(label, style: style)],
      ),
      onPressed: onPressed,
    );
  }
}

class TransparentIconAndTextBtn extends StatelessWidget {
  final String label;
  final AssetImage icon;
  final double iconSize;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? styledImageIconColor;
  final bool bigMode;
  final TextStyle? style;

  const TransparentIconAndTextBtn(this.label, this.icon,
      {super.key,
      this.onPressed,
      this.color,
      this.textColor,
      this.styledImageIconColor,
      this.bigMode = false,
      this.iconSize = 16,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TransparentBtn(
      bigMode: bigMode,
      onPressed: onPressed,
      child: Row(
        children: [
          StyledImageIcon(icon, size: iconSize, color: styledImageIconColor!),
          HSpace(Insets.sm),
          Text(label, style: style),
          HSpace(
              3), // Add a bit of extra padding to the right, seems like Icon() has it's own baked in padding
        ],
      ),
    );
  }
}
