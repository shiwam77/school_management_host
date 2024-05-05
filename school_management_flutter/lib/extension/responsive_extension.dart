import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// extension ResponsiveOnContext on BuildContext {
//   T responsive<T>(
//     T defaultVal, {
//     T? sm,
//     T? md,
//     T? lg,
//     T? xl,
//   }) {
//     final wd = MediaQuery.of(this).size.width;
//     return wd >= 1280
//         ? (xl ?? lg ?? md ?? sm ?? defaultVal)
//         : wd >= 1024
//             ? (lg ?? md ?? sm ?? defaultVal)
//             : wd >= 768
//                 ? (md ?? sm ?? defaultVal)
//                 : wd >= 640
//                     ? (sm ?? defaultVal)
//                     : defaultVal;
//   }
// }

extension ResponsiveExtensionOnContext on BuildContext {
  T responsive<T>(
    T defaultValue, {
    T? ssm,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    return ResponsiveValue(this,
            conditionalValues: [
              if (ssm != null)
                Condition.equals(name: 'MOBILE_SMALL', value: ssm),
              if (sm != null) Condition.equals(name: MOBILE, value: sm),
              if (md != null) Condition.equals(name: TABLET, value: md),
              if (lg != null) Condition.largerThan(name: TABLET, value: lg),
              if (xl != null) Condition.equals(name: DESKTOP, value: xl),
            ],
            defaultValue: defaultValue)
        .value;
  }
}
