import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:school_management_client/school_management_client.dart';
import 'package:school_management_flutter/router/route_handle_2.0.dart';
import 'package:school_management_flutter/theme/theme.dart';
import 'package:school_management_flutter/theme/theme_notifier.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

var logger = Logger();

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

const String sentrydsn =
    "https://o4506931461357568.ingest.us.sentry.io/4506931462733824";

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

void main() {
  mainDelegate();
}

void mainDelegate() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    CustomNavigationHelper.instance;
    if (!kIsWeb &&
        [
          TargetPlatform.windows,
          TargetPlatform.android,
        ].contains(defaultTargetPlatform)) {
      SystemTheme.accentColor.load();
    }

    if (isDesktop) {
      await flutter_acrylic.Window.initialize();
      if (defaultTargetPlatform == TargetPlatform.windows) {
        await flutter_acrylic.Window.showWindowControls();
      }
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

      await WindowManager.instance.ensureInitialized();
      windowManager.waitUntilReadyToShow().then((_) async {
        await windowManager.setTitleBarStyle(
          TitleBarStyle.normal,
          windowButtonVisibility: true,
        );
        await windowManager.setIcon('asset/icon/splasgScreen.png');
        await windowManager.setTitle("School Management");
        // await windowManager.setSize(const Size(900, 850));
        // await windowManager.setMinimumSize(const Size(1000, 750));
        await windowManager.show();
        await windowManager.setFullScreen(false);
        await windowManager.maximize(vertically: true);
        await windowManager.setMaximizable(true);
        await windowManager.setPreventClose(true);
        await windowManager.center(animate: true);
        await windowManager.setResizable(true);
        await windowManager.setSkipTaskbar(false);
      });
    }

    await SentryFlutter.init((options) {
      options.dsn = sentrydsn;

      options.tracesSampleRate = 1.0;
      options.autoAppStart = true;
      options.attachScreenshot = false;
      options.enableAutoPerformanceTracing = true;
      options.enableUserInteractionTracing = true;
      options.idleTimeout = const Duration(seconds: 2);
      options.environment = 'RMS_Frontend';
    },
        appRunner: () => runApp(SentryScreenshotWidget(
              child: SentryUserInteractionWidget(
                child: DefaultAssetBundle(
                    bundle: SentryAssetBundle(),
                    child: const ProviderScope(child: MyApp())),
              ),
            )));

    /// register global error handler
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isInDebugMode) {
        FlutterError.dumpErrorToConsole(details);
        await Sentry.captureException(
          details,
          stackTrace: details.stack,
        );
      } else {
        // FirebaseCrashlytics.instance.recordFlutterError;
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };
  }, (error, stackTrace) async {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);

    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    try {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    } catch (e, stacktrace) {
      logger.e(e);
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    if (!isDesktop && !kIsWeb) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom]);
    }
    if (isDesktop) {
      _init();
    }
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars

    super.dispose();
  }

  void _init() async {
    // Add this line to override the default close handler
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    logger.d("wedwde");
    await windowManager.destroy();
  }

  // setApiToken() async {
  //   secureStorage.clearApiConfig();
  //   await secureStorage.setAccessToken(
  //       accessToken:
  //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEzMjY4NjI5LCJpYXQiOjE3MDg5NDg2MjksImp0aSI6ImIxNTI4MDdmOTNmYTQ5MDdhNmI5MThmZjQ3ZjM4ZTRmIiwidXNlcl9pZCI6Mn0.pvKFx7BJjUyX_ZdSY8ZXSzVtbqPznov6R91nrGlC6Lo");
  //   logger.d((await secureStorage.getAccessToken()));
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1011, 1080),
        minTextAdapt: false,
        splitScreenMode: false,
        fontSizeResolver: FontSizeResolvers.height,
        builder: (context, child) {
          return ValueListenableBuilder(
              valueListenable: themeNotifier,
              builder: (context, brightness, innerChild) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: CustomNavigationHelper.router,
                  title: 'School Management',
                  themeMode: ThemeMode.dark,
                  // themeMode: themeNotifier.value == ThemeModeOption.system
                  //     ? MediaQuery.of(context).platformBrightness ==
                  //             Brightness.dark
                  //         ? ThemeMode.dark
                  //         : ThemeMode.light
                  //     : themeNotifier.value == ThemeModeOption.dark
                  //         ? ThemeMode.dark
                  //         : ThemeMode.light,
                  theme: AppTheme(context: context, isDarkTheme: true).getTheme,
                  darkTheme:
                      AppTheme(context: context, isDarkTheme: true).getTheme,
                );
              });
        });
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   // These fields hold the last result or error message that we've received from
//   // the server or null if no result exists yet.
//   String? _resultMessage;
//   String? _errorMessage;

//   final _textEditingController = TextEditingController();

//   // Calls the `hello` method of the `example` endpoint. Will set either the
//   // `_resultMessage` or `_errorMessage` field, depending on if the call
//   // is successful.
//   void _callHello() async {
//     try {
//       final result = await client.example.hello(_textEditingController.text);
//       setState(() {
//         _errorMessage = null;
//         _resultMessage = result;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = '$e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: TextField(
//                 controller: _textEditingController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your name',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: ElevatedButton(
//                 onPressed: _callHello,
//                 child: const Text('Send to Server'),
//               ),
//             ),
//             _ResultDisplay(
//               resultMessage: _resultMessage,
//               errorMessage: _errorMessage,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // _ResultDisplays shows the result of the call. Either the returned result from
// // the `example.hello` endpoint method or an error message.
// class _ResultDisplay extends StatelessWidget {
//   final String? resultMessage;
//   final String? errorMessage;

//   const _ResultDisplay({
//     this.resultMessage,
//     this.errorMessage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String text;
//     Color backgroundColor;
//     if (errorMessage != null) {
//       backgroundColor = Colors.red[300]!;
//       text = errorMessage!;
//     } else if (resultMessage != null) {
//       backgroundColor = Colors.green[300]!;
//       text = resultMessage!;
//     } else {
//       backgroundColor = Colors.grey[300]!;
//       text = 'No server response yet.';
//     }

//     return Container(
//       height: 50,
//       color: backgroundColor,
//       child: Center(
//         child: Text(text),
//       ),
//     );
//   }
// }
