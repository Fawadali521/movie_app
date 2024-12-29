import 'package:logger/logger.dart';
import 'package:movie_app/core/logger_customizations/custom_log_output.dart';
import 'package:movie_app/core/logger_customizations/custom_log_printer.dart';

class CustomLogger extends Logger {
  final String className;

  CustomLogger({required this.className})
      : super(
          output: CustomLogOutput(),
          printer: CustomLogPrinter(className: className),
        );
}
