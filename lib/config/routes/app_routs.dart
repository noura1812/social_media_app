import 'package:flutter/material.dart';
import 'package:social_media_app/features/home_screen/presentation/pages/home_layout.dart';

class Routes {
  static const String splashScreen = '/';
  static const String homeLayOut = 'home layout';
  static const String settingsScreen = 'settings screen';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeLayOut:
        return MaterialPageRoute(
          builder: (context) => const HomeLayOut(),
        );
      default:
        {
          return MaterialPageRoute(
            builder: (context) => unDefineRoute(),
          );
        }
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Center(
          child: Text('unDefinedRoute'),
        ),
      );
}
