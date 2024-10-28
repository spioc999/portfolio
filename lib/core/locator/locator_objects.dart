import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/resources/res.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorObjects({bool isTesting = false}) {
  if (!isTesting) {
    getIt.registerSingleton<PersonalDataService>(
      PersonalDataService(
        me: Me(
          initials: 'SPC',
          firstName: 'Simone Pio',
          lastName: 'Caronia',
          dateOfBirth: DateTime(1999, 10, 20),
          imageUrls: [Res.jpgMeSerious, Res.jpgMeSmiling],
          role: (appLocalization) => appLocalization.me_role,
          about: About(
            intro: (appLocalization, param) =>
                appLocalization.aboutmeview_intro(param['yearsOld']),
          ),
          education: Education(),
          experience: Experience(),
        ),
      ),
    );
    getIt.registerSingleton<SharedPref>(SharedPref());
    getIt.registerSingleton<DateTimeService>(DateTimeService());
  }
}
