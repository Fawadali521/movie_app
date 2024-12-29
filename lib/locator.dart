import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/api_services.dart';
import 'package:movie_app/core/services/navigation_services.dart';

import 'core/services/database_service.dart';
import 'core/services/local_storage_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton(ApiServices());
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(DataBaseService());
}
