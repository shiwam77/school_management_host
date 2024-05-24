import 'package:flutter/material.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/base_styled_button.dart';
import 'package:school_management_flutter/_internal/styled_components/styled_image_icon.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/styles.dart';

class SecondaryTextBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? txtStyle;
  const SecondaryTextBtn(this.label,
      {super.key, this.onPressed, this.txtStyle});

  @override
  Widget build(BuildContext context) {
    return SecondaryBtn(
        onPressed: onPressed, child: Text(label, style: txtStyle));
  }
}

class SecondaryIconBtn extends StatelessWidget {
  /// Must be either an `AssetImage` for an `ImageIcon` or an `IconData` for a regular `Icon`
  final AssetImage icon;
  final VoidCallback? onPressed;
  final Color color;

  const SecondaryIconBtn(this.icon,
      {super.key, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return SecondaryBtn(
      onPressed: onPressed,
      minHeight: 36,
      minWidth: 36,
      contentPadding: Insets.sm,
      child: StyledImageIcon(icon, size: 20, color: color),
    );
  }
}

class SecondaryBtn extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double minWidth;
  final double minHeight;
  final double contentPadding;
  final void Function(bool)? onFocusChanged;

  const SecondaryBtn(
      {super.key,
      this.child,
      this.onPressed,
      this.minWidth = 78,
      this.minHeight = 42,
      this.contentPadding = Insets.m,
      this.onFocusChanged});

  @override
  SecondaryBtnState createState() => SecondaryBtnState();
}

class SecondaryBtnState extends State<SecondaryBtn> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isMouseOver = true),
      onExit: (_) => setState(() => _isMouseOver = false),
      child: BaseStyledBtn(
        minWidth: widget.minWidth,
        minHeight: widget.minHeight,
        contentPadding: EdgeInsets.all(widget.contentPadding),
        bgColor: context.appColors.color1,
        outlineColor: (_isMouseOver
            ? context.appColors.color1!
            : context.appColors.color1!.withOpacity(.35)),
        hoverColor: context.appColors.color1,
        onFocusChanged: widget.onFocusChanged,
        downColor: context.appColors.color1!.withOpacity(.35),
        borderRadius: Corners.s5,
        onPressed: widget.onPressed,
        child: IgnorePointer(child: widget.child),
      ),
    );
  }
}
