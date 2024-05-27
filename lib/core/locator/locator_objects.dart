import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    getIt.registerSingleton<PersonalDataService>(
      PersonalDataService(
        me: Me(
          role: (appLocalization) => appLocalization.me_role,
          about: About(
            intro: (appLocalization) => '',
          ),
          education: Education(),
          experience: Experience(),
        ),
      ),
    );
    getIt.registerSingleton<SharedPref>(SharedPref());
  }
}
