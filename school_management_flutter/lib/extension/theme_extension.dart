import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on BuildContext {
  AppColorExtension get appColors =>
      Theme.of(this).extension<AppColorExtension>()!;
}

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color? color1;
  final Color? color2;
  final Color? color3;
  const AppColorExtension({
    this.color1,
    this.color2,
    this.color3,
  });

  // Named constructor with default values for easy addition of more colors
  AppColorExtension.withColors({
    Color? color1,
    Color? color2,
    Color? color3,
    Color? color4,
  }) : this(
          color1: color1,
          color2: color2,
          color3: color3,
        );

  @override
  AppColorExtension copyWith({
    Color? color1,
    Color? color2,
    Color? color3,
    Color? color4,
    Color? dotColor,
    Color? continueWithText,
    Color? dropDownWidgetBackground,
    Color? dropDownButtonColor,
    Color? borderColor,
    Color? cardColor,
    Color? menuIconColor,
    Color? drawerColor,
    Color? friendCardTextColor,
    Color? dropDownIconColor,
    Color? drawerCardColor,
  }) {
    return AppColorExtension(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      color1: Color.lerp(color1, other.color1, t),
      color2: Color.lerp(color2, other.color2, t),
      color3: Color.lerp(color3, other.color3, t),
    );
  }
}
