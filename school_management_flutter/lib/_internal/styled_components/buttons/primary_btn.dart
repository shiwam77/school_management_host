import 'package:flutter/material.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/base_styled_button.dart';
import 'package:school_management_flutter/extension/theme_extension.dart';
import 'package:school_management_flutter/styles.dart';

class PrimaryBtn extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final bool bigMode;

  const PrimaryBtn({Key? key, this.child, this.onPressed, this.bigMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStyledBtn(
      minWidth: bigMode ? 160 : 78,
      minHeight: bigMode ? 60 : 42,
      contentPadding: EdgeInsets.all(bigMode ? Insets.l : Insets.m),
      bgColor: context.appColors.color1,
      hoverColor: context.appColors.color1,
      downColor: context.appColors.color1,
      borderRadius: bigMode ? Corners.s8 : Corners.s5,
      child: child,
      onPressed: onPressed,
    );
  }
}

class PrimaryTextBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool bigMode;
  final TextStyle? txtStyle;

  const PrimaryTextBtn(this.label,
      {super.key, this.onPressed, this.bigMode = false, this.txtStyle});

  @override
  Widget build(BuildContext context) {
    return PrimaryBtn(
        bigMode: bigMode,
        onPressed: onPressed,
        child: Text(label, style: txtStyle));
  }
}
