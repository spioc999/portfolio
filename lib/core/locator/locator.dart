import 'package:get_it/get_it.dart';
import 'package:spioc_portfolio/core/locator/locator_interactors.dart';
import 'package:spioc_portfolio/core/locator/locator_objects.dart';
import 'package:spioc_portfolio/core/locator/locator_states.dart';
import 'package:spioc_portfolio/core/locator/locator_view_models.dart';
import 'package:spioc_portfolio/core/locator/locator_views.dart';

GetIt getIt = GetIt.instance;
bool _initialized = false;

Future<void> locatorSetup({bool isTesting = false}) async {
  if (!_initialized) {
    setupLocatorObjects(isTesting: isTesting);
    setupLocatorViews();
    setupLocatorInteractors();
    setupLocatorStates();
    setupLocatorViewModels();
    await getIt.allReady();
    _initialized = true;
  }
}
