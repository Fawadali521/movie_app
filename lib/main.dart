import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/app/movie_app.dart';
import 'package:movie_app/locator.dart';

import 'core/logger_customizations/custom_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final log = CustomLogger(className: 'main');
  log.i('Testing info logs');
  log.w('Testing Warning logs');
  log.d('Testing debug logs');
  log.e('Testing error logs');
  log.t('Testing Trace log');
  await setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MovieApp(),
  );
}
