import 'package:flutter/material.dart';
import 'package:movie_app/ui/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:movie_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:movie_app/ui/screens/watch/movie_details_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoute.splash:
        return MaterialPageRoute<void>(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case NamedRoute.bottomNavigation:
        return MaterialPageRoute<void>(
          builder: (context) => const BottomNavigationScreen(),
          settings: settings,
        );
      case NamedRoute.movieDetails:
        return MaterialPageRoute<void>(
          builder: (context) => const MovieDetailsScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name),
          settings: settings,
        );
    }
  }
}

class UndefinedView extends StatelessWidget {
  final String? name;
  const UndefinedView({
    this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}

class NamedRoute {
  NamedRoute._();

  static const String splash = '/';
  static const String bottomNavigation = '/bottomNavigation';
  static const String movieDetails = '/movieDetails';
}
