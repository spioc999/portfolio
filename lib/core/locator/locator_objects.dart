import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    getIt.registerSingleton<PersonalDataService>(
      PersonalDataService(me: simonePioCaronia),
    );
    getIt.registerSingletonAsync<SharedPref>(() async {
      final sharedPref = SharedPref();
      await sharedPref.init();
      return sharedPref;
    });
    getIt.registerSingleton<DateTimeService>(DateTimeService());
    getIt.registerSingleton<FileService>(FileService());
  }
}
