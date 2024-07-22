import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/views/view_contracts.dart';
import 'package:spioc_portfolio/views/view_models.dart';

void setupLocatorViewModels() {
  getIt.registerFactory<AboutMeViewModelContract>(
    () => AboutMeViewModel(
      personalDataInteractor: getIt<PersonalDataInteractor>(),
    ),
  );
  getIt.registerFactory<EducationViewModelContract>(
    () => EducationViewModel(
      personalDataInteractor: getIt<PersonalDataInteractor>(),
    ),
  );
  getIt.registerFactory<ExperienceViewModelContract>(
    () => ExperienceViewModel(
      personalDataInteractor: getIt<PersonalDataInteractor>(),
    ),
  );
  getIt.registerFactory<HomeViewModelContract>(
    () => HomeViewModel(
      personalDataInteractor: getIt<PersonalDataInteractor>(),
    ),
  );
  getIt.registerFactory<NotFoundViewModelContract>(
    () => NotFoundViewModel(),
  );
}
