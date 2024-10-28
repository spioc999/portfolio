import 'package:simple_icons/simple_icons.dart';
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
          role: 'Flutter & AI Engineer',
          contacts: [
            Contact(
              link: 'https://github.com/spioc999/',
              icon: SimpleIcons.github,
            ),
            Contact(
              link: 'https://www.linkedin.com/in/simone-pio-caronia-8b959916b/',
              icon: SimpleIcons.linkedin,
            ),
            Contact(
              link: 'https://www.instagram.com/spioc_999/',
              icon: SimpleIcons.instagram,
            ),
          ],
          dateOfBirth: DateTime(1999, 10, 20),
          imageUrls: [Res.jpgMeSerious, Res.jpgMeSmiling],
          about: About(),
          education: Education(),
          experience: Experience(),
        ),
      ),
    );
    getIt.registerSingleton<SharedPref>(SharedPref());
    getIt.registerSingleton<DateTimeService>(DateTimeService());
  }
}
