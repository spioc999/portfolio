import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/view_contracts.dart';
import 'package:spioc_portfolio/views/view_models.dart';

void setupLocatorViewModels() {
  getIt.registerFactory<HomeViewModelContract>(
    () => HomeViewModel(),
  );

  getIt.registerFactory<NotFoundViewModelContract>(
    () => NotFoundViewModel(),
  );
}
