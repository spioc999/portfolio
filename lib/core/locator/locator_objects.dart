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
          contacts: [
            Contact(
              link: 'https://github.com/spioc999/',
              type: ContactType.github,
            ),
            Contact(
              link: 'https://www.linkedin.com/in/simone-pio-caronia-8b959916b/',
              type: ContactType.linkedin,
            ),
            Contact(
              link: 'https://www.instagram.com/spioc_999/',
              type: ContactType.instagram,
            ),
          ],
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
