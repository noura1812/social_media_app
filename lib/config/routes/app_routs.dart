import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homeLayOut = 'home layout';
  static const String settingsScreen = 'settings screen';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    /*  switch (routeSettings.name) {
      case Routes.homeLayOut:
        return MaterialPageRoute(
          builder: (context) => const HomeLayOut(),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: routeSettings.arguments),
          builder: (context) => SetUsersData(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:}*/
    {
      return MaterialPageRoute(
        builder: (context) => unDefineRoute(),
      );
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Center(
          child: Text('unDefinedRoute'),
        ),
      );
}
