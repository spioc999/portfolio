import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/modules/modules.dart';

void setupLocatorInteractors() {
  getIt.registerFactory<AppearanceInteractor>(
    () => AppearanceInteractor(
      sharedPref: getIt<SharedPref>(),
    ),
  );
}
