import 'package:flutter/material.dart';

class StackConstraints extends InheritedWidget {
  final BoxConstraints constraints;

  const StackConstraints(
      {super.key, required this.constraints, required super.child});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    var old = (oldWidget as StackConstraints).constraints;
    return old.maxWidth != constraints.maxWidth ||
        old.maxHeight != constraints.maxHeight;
  }
}

class PinnedStack extends StatelessWidget {
  final List<Widget> children;
  final StackFit fit;
  final AlignmentGeometry alignment;
  final TextDirection textDirection;
  final Clip clip;

  const PinnedStack(
      {super.key,
      required this.children,
      this.fit = StackFit.expand,
      this.alignment = Alignment.topLeft,
      this.textDirection = TextDirection.ltr,
      this.clip = Clip.none});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return StackConstraints(
        constraints: constraints,
        child: Stack(
          fit: fit,
          alignment: alignment,
          clipBehavior: clip,
          textDirection: textDirection,
          children: children,
        ),
      );
    });
  }
}
