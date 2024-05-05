import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_management_flutter/auth/view/forget_password_screen.dart';
import 'package:school_management_flutter/auth/view/otp_screen.dart';
import 'package:school_management_flutter/auth/view/signup_screen.dart';
import 'package:school_management_flutter/src/dashboard/view/dashboard.dart';
import 'package:school_management_flutter/src/dashboard/view/home_screen.dart';

import '../auth/view/login_screen.dart';
import '../src/academics/view/class_screen.dart';
import '../src/academics/view/section_screen.dart';
import '../src/academics/view/subject_screen.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static String homePath = '/Dashboard';
  static String section = '/section';
  static String subject = '/subject';
  static String classScreen = '/class';
  static const String loginPath = '/';
  static const String forgotPassword = '/forgotpassword';
  static const String otpscreen = '/otpscreen';
  static const String signupScreen = '/SignupScreen';

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    List<RouteBase> routes = [
      ShellRoute(
        parentNavigatorKey: rootNavigatorKey,
        routes: [
          //index:0

          GoRoute(
            path: '/Dashboard',
            pageBuilder: (context, GoRouterState state) {
              return const NoTransitionPage(child: HomeScreen());
            },
          ),
          GoRoute(
            path: section,
            pageBuilder: (context, GoRouterState state) {
              return const NoTransitionPage(child: SectionScreen());
            },
          ),

          GoRoute(
            path: subject,
            pageBuilder: (context, GoRouterState state) {
              return const NoTransitionPage(child: SubjectScreen());
            },
          ),
          GoRoute(
            path: classScreen,
            pageBuilder: (context, GoRouterState state) {
              return const NoTransitionPage(child: ClassScreen());
            },
          ),
        ],
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
              child: DashBoard(
            child: child,
          ));
        },
      ),

      GoRoute(
        path: loginPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: otpscreen,
        builder: (context, state) => const OtpScreen(),
      ),

      GoRoute(
        path: signupScreen,
        builder: (context, state) => const SignupScreen(),
      )

      ///ToDo add your route here
    ];

    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: homePath,
      routes: routes,
      redirect: (BuildContext context, GoRouterState state) async {
        return null;
        // if ((await secureStorage.getAccessToken() == null)) {
        //   return loginPath;
        // } else if ((await secureStorage.isAuthenticated &&
        //     !(await secureStorage.isAppInitialize))) {
        //   await secureStorage.setAppInitialize(value: true);
        //   return homePath;
        // } else {
        //   return null;
        // }
      },
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
