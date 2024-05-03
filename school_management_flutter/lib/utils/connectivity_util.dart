import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

export 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    show InternetStatus;

class InternetStatusWidget extends StatefulWidget {
  final Widget child;

  /// Constructor for [_NoInternetDisplay].
  ///
  /// A widget that is displayed when there is no internet connection.
  const InternetStatusWidget({super.key, required this.child});

  @override
  State<InternetStatusWidget> createState() => _InternetStatusWidgetState();
}

class _InternetStatusWidgetState extends State<InternetStatusWidget> {
  late StreamSubscription<InternetStatus> _subscription;
  Stream<InternetStatus>? _connectionStatus;

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      setState(() {
        _connectionStatus =
            Stream.value(status); // Update stream with new value
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetStatus>(
      stream: _connectionStatus,
      builder: (context, snapshot) {
        final internetStatus = snapshot.data;
        if (internetStatus == InternetStatus.connected &&
            snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return widget.child;
        } else if (internetStatus == InternetStatus.disconnected &&
            snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return const NoInternetDisplay();
        } else {
          return widget.child;
        }
      },
    );

  }
}

class NoInternetDisplay extends StatelessWidget {
  /// Constructor for [_NoInternetDisplay].
  ///
  /// A widget that is displayed when there is no internet connection.
  const NoInternetDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4,
            ),
            SizedBox(height: 10),
            Text(
              'No internet connection',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Text('Please connect to an internet to proceed.'),
          ],
        ),
      ),
    );
  }
}
