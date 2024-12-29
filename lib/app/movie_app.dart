import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/navigation_services.dart';
import 'package:movie_app/locator.dart';
import 'package:movie_app/ui/screens/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:movie_app/ui/screens/watch/watch_view_model.dart';
import 'package:provider/provider.dart';

class MovieApp extends StatelessWidget {
  MovieApp({super.key});
  final NavigationService navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(430, 932),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavigationViewModel()),
          ChangeNotifierProvider(create: (_) => WatchViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationService.rootNavKey,
          title: 'Movie App',
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: NamedRoute.splash,
        ),
      ),
    );
  }
}
