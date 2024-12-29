import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/text_styles.dart';
import 'package:movie_app/core/logger_customizations/custom_logger.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/services/database_service.dart';
import 'package:movie_app/core/services/local_storage_service.dart';
import 'package:movie_app/core/services/navigation_services.dart';
import 'package:movie_app/core/services/network_service.dart';
import 'package:movie_app/locator.dart';
import 'package:movie_app/ui/custom_widgets/custom_snackbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final log = CustomLogger(className: 'SplashScreen');
  final _dbService = locator<DataBaseService>();
  final localStorage = locator<LocalStorageService>();
  final NavigationService navigationService = locator<NavigationService>();
  @override
  void initState() {
    super.initState();
    _initialSetup(context);
  }

  _initialSetup(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    await localStorage.init();
    final connectivityResult = await NetworkService().checkInternet();
    log.i("check internet connection ==>$connectivityResult");
    if (!connectivityResult) {
      customSnackBar(
        message: 'Please check your internate connection',
      );
      return;
    }
    requestGetAllMovies();
    // if (localStorage.onBoardingPage) {
    //   // Get.offAll(() => const BottomNavigationScreen());
    // }
  }

  requestGetAllMovies() async {
    log.i("Calling get all movies...");
    try {
      // Call the getAllMovies function to fetch data
      bool isGet = await _dbService.getAllMovies();
      log.i("Success: isGet}");
      if (isGet) {
        log.i("Movies fetched successfully with coun");
        navigationService.nav.pushReplacementNamed(NamedRoute.bottomNavigation);
      } else {
        log.e("No movies found in the response");
        customSnackBar(
          message: 'No movies found ',
        );
      }
    } catch (e) {
      log.e("Error occurred while fetching movies: $e");
      customSnackBar(
        message: 'No movies found ',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Text(
          "Movie App",
          style: kTextStyle1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
