import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    getIt.registerSingleton<PersonalDataService>(
      PersonalDataService(me: simonePioCaronia),
    );
    getIt.registerSingleton<SharedPref>(SharedPref());
    getIt.registerSingleton<DateTimeService>(DateTimeService());
  }
}
