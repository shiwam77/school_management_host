import 'package:flutter/material.dart';

typedef HoverBuilder = Widget Function(BuildContext context, bool isHovering);

class MouseHoverBuilder extends StatefulWidget {
  final bool isClickable;

  const MouseHoverBuilder(
      {super.key, required this.builder, this.isClickable = false});

  final HoverBuilder builder;

  @override
  MouseHoverBuilderState createState() => MouseHoverBuilderState();
}

class MouseHoverBuilderState extends State<MouseHoverBuilder> {
  bool isOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isClickable
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (p) => setOver(true),
      onExit: (p) => setOver(false),
      child: widget.builder(context, isOver),
    );
  }

  void setOver(bool value) => setState(() => isOver = value);
}
