import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:spioc_portfolio/app/portfolio_web_app.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/utils/web_utils.dart';

void main() async {
  WebUtils.setTitle(loading);

  await commonRuns();

  runApp(const PortfolioWebApp());
}

Future<void> commonRuns({bool isTesting = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  await locatorSetup();
  initRouting();

  await getIt.allReady();
}
