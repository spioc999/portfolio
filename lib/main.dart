import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:spioc_portfolio/app/portifolio_web_app.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';

void main() async {
  await commonRuns();

  runApp(const PortfolioWebApp());
}

Future<void> commonRuns({bool isTesting = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  locatorSetup();
  initRouting();
}
