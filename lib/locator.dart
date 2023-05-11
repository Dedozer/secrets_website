import 'package:get_it/get_it.dart';
import 'package:secrets_website/services/navigation_service.dart';

import 'services/api.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}