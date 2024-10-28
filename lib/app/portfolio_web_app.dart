import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spioc_portfolio/app/portfolio_app_theming.dart';
import 'package:spioc_portfolio/constants/animation_duration.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/providers.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/utils/web_utils.dart';

class PortfolioWebApp extends StatelessWidget {
  const PortfolioWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Selector<AppSettingsProvider, AppSettings>(
        selector: (_, provider) => provider.appSettings,
        builder: (_, settings, __) => MaterialApp.router(
          onGenerateTitle: (context) =>
              WebUtils.getTitleFromCurrentRoute(context),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: PortfolioAppTheming.lightTheme,
          darkTheme: PortfolioAppTheming.darkTheme,
          themeMode: settings.themeMode,
          locale: settings.locale,
          routerConfig: routerConfig,
          builder: (_, child) => TweenAnimationBuilder(
            tween: zeroOneTween,
            curve: Curves.ease,
            duration: AnimationDuration.slowDuration,
            builder: (_, opacity, child) => Opacity(
              opacity: opacity,
              child: child,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
