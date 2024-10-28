import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/view_contracts.dart';

void setupLocatorStates() {
  getIt.registerFactory<AboutMeState>(AboutMeState.new);
  getIt.registerFactory<EducationState>(EducationState.new);
  getIt.registerFactory<ExperienceState>(ExperienceState.new);
  getIt.registerFactory<HomeState>(HomeState.new);
  getIt.registerFactory<NotFoundState>(NotFoundState.new);
}
