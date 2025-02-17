import 'package:flutter/material.dart';

class RotatingDots extends StatefulWidget {
  final double size;
  final Color color;

  const RotatingDots({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  _RotatingDotsState createState() => _RotatingDotsState();
}

class _RotatingDotsState extends State<RotatingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _leftSideDotTranslate;

  late Animation<double> _middleDotScale;
  late Animation<Offset> _middleDotTranslate;

  late Animation<double> _rightDotScale;
  late Animation<Offset> _rightSideDotTranslate;

  final Interval _interval = const Interval(
    0.0,
    1.0,
    curve: Curves.easeOutCubic,
  );
  @override
  void initState() {
    super.initState();
    final double size = widget.size;
    final double dotSize = size / 4;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();

    _leftSideDotTranslate = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(size - dotSize, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _interval,
      ),
    );

    _middleDotScale = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _interval,
      ),
    );

    _middleDotTranslate = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-(size - dotSize) / 2, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _interval,
      ),
    );

    _rightDotScale = Tween<double>(
      begin: 1.0,
      end: 0.6,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _interval,
      ),
    );

    _rightSideDotTranslate = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-(size - dotSize) / 2, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: _interval,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;

    final Color color = widget.color;
    final double dotSize = size / 4;
    return SizedBox(
      width: size,
      height: 26,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Transform.translate(
              offset: _leftSideDotTranslate.value,
              child: DrawDot.circular(
                dotSize: dotSize,
                color: color,
              ),
            ),
            Transform.scale(
              scale: _middleDotScale.value,
              child: Transform.translate(
                offset: _middleDotTranslate.value,
                child: DrawDot.circular(
                  dotSize: dotSize,
                  color: color,
                ),
              ),
            ),
            Transform.translate(
              offset: _rightSideDotTranslate.value,
              child: Transform.scale(
                scale: _rightDotScale.value,
                child: DrawDot.circular(
                  dotSize: dotSize,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class DrawDot extends StatelessWidget {
  final double width;
  final double height;
  final bool circular;
  final Color color;

  const DrawDot.circular({
    super.key,
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  const DrawDot.elliptical({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  })  : circular = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}
