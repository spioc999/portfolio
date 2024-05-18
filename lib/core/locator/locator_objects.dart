import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    getIt.registerSingleton<SharedPref>(SharedPref());
  }
}
