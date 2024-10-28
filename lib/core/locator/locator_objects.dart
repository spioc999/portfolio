import 'package:spioc_portfolio/core/locator/locator.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    // getIt.registerSingleton<AppInfoService>(AppInfoService());
    // getIt.registerLazySingleton<SharedPref>(() => SharedPref());
  }
}
