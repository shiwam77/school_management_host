import 'package:flutter/material.dart';
import 'package:school_management_flutter/_internal/components/spacing.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/primary_btn.dart';
import 'package:school_management_flutter/_internal/styled_components/buttons/secondary_btn.dart';
import 'package:school_management_flutter/const/app_string.dart';
import 'package:school_management_flutter/styles.dart';

class OkCancelBtnRow extends StatelessWidget {
  final VoidCallback? onOkPressed;
  final VoidCallback? onCancelPressed;
  final String? okLabel;
  final String? cancelLabel;

  const OkCancelBtnRow(
      {super.key,
      this.onOkPressed,
      this.onCancelPressed,
      this.okLabel,
      this.cancelLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        if (onOkPressed != null)
          PrimaryTextBtn(okLabel ?? AppString.BTN_OK.toUpperCase(),
              onPressed: onOkPressed),
        const HSpace(Insets.m),
        if (onCancelPressed != null)
          SecondaryTextBtn(cancelLabel ?? AppString.BTN_CANCEL.toUpperCase(),
              onPressed: onCancelPressed),
      ],
    );
  }
}
