import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/view_contracts.dart';

void setupLocatorStates() {
  getIt.registerFactory<HomeState>(
    HomeState.new,
  );
}
