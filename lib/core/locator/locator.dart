import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spioc_portfolio/core/locator/locator_interactors.dart';
import 'package:spioc_portfolio/core/locator/locator_objects.dart';
import 'package:spioc_portfolio/core/locator/locator_states.dart';
import 'package:spioc_portfolio/core/locator/locator_view_models.dart';
import 'package:spioc_portfolio/core/locator/locator_views.dart';

GetIt getIt = GetIt.instance;
bool _initialized = false;

void locatorSetup({bool isTesting = false}) {
  if (!_initialized) {
    setupLocatorObjects(isTesting: isTesting);
    setupLocatorViews();
    setupLocatorInteractors();
    setupLocatorStates();
    setupLocatorViewModels();
    _initialized = true;
  }
}

void locatorSetupWithContext({required BuildContext context}) {
  if (!getIt.isRegistered<AppLocalizations>()) {
    getIt.registerSingleton<AppLocalizations>(
      AppLocalizations.of(context)!,
    );
  }
}
