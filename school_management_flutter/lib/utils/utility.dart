import 'package:flutter/material.dart';

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

class FutureAPIBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final T? initialData;
  final AsyncWidgetBuilder<T>? builder;
  final AsyncWidgetBuilder<T>? errorBuilder;
  final AsyncWidgetBuilder<T>? loadingBuilder;
  final AsyncWidgetBuilder<T>? dataBuilder;
  const FutureAPIBuilder({
    super.key,
    this.future,
    this.initialData,
    this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.dataBuilder,
  }) : assert(
            builder != null ||
                errorBuilder != null ||
                loadingBuilder != null ||
                dataBuilder != null,
            'If builder is not null,errorBuilder, loadingBuilder, or dataBuilder must be provided');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<T>(
      key: key,
      future: future,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        //check if auth error has occured
        if (builder == null) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.error != null) {
            return errorBuilder!(context, snapshot);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingBuilder!(context, snapshot);
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return dataBuilder!(context, snapshot);
          } else {
            return loadingBuilder!(context, snapshot);
          }
        } else {
          return builder!(context, snapshot);
        }
      },
    );
  }
}
