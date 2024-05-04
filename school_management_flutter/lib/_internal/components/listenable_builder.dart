import 'package:flutter/material.dart';

class ListenableBuilder extends AnimatedBuilder {
  const ListenableBuilder({
    super.key,
    required Listenable listenable,
    required super.builder,
    super.child,
  }) : super(animation: listenable);
}
