import 'package:flutter/material.dart';
import 'package:school_management_flutter/utils/connectivity_util.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? path = settings.name;
    print(path);
    //o

    // extract path parameters

    switch (path) {
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return const SizedBox();
            });
      case 'Home':
        // UserInfoModel? userInfoModel = settings.arguments as UserInfoModel?;
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return const Scaffold(
                body: InternetStatusWidget(child: SizedBox()),
              );
            });

      default:
        // if there is no such named route, return error route
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return const ErrorPage();
    });
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
