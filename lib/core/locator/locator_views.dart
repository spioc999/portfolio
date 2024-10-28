import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/views.dart';

void setupLocatorViews() {
  getIt.registerFactory<AboutMeView>(AboutMeView.new);
  getIt.registerFactory<EducationView>(EducationView.new);
  getIt.registerFactory<ExperienceView>(ExperienceView.new);
  getIt.registerFactory<HomeView>(HomeView.new);
  getIt.registerFactory<NotFoundView>(NotFoundView.new);
}
