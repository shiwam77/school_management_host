import 'package:flutter/material.dart';

typedef SeparatorBuilder = Widget Function();

class SeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final SeparatorBuilder? separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;

  const SeparatedRow({
    super.key,
    required this.children,
    this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> c = children.toList();
    for (var i = c.length; i-- > 0;) {
      if (i > 0 && separatorBuilder != null) c.insert(i, separatorBuilder!());
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: c,
    );
  }
}

class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final SeparatorBuilder? separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;

  const SeparatedColumn({
    super.key,
    required this.children,
    this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> c = children.toList();
    for (var i = c.length; i-- > 0;) {
      if (i > 0 && separatorBuilder != null) c.insert(i, separatorBuilder!());
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: c,
    );
  }
}
