import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorInteractors() {
  getIt.registerFactory<AppSettingsInteractor>(
    () => AppSettingsInteractor(
      sharedPref: getIt<SharedPref>(),
    ),
  );

  getIt.registerFactory<PersonalDataInteractor>(
    () => PersonalDataInteractor(
      personalDataService: getIt<PersonalDataService>(),
      dateTimeService: getIt<DateTimeService>(),
      fileService: getIt<FileService>(),
    ),
  );
}
