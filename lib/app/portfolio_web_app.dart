import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spioc_portfolio/app/portfolio_themes.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/providers.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/ui/toolkit/emoji_loader.dart';

class PortfolioWebApp extends StatelessWidget {
  const PortfolioWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        //TODO add selector for changing theme
        onGenerateTitle: (_) => fullName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: PortfolioAppThemes.lightTheme,
        darkTheme: PortfolioAppThemes.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: routerConfig,
        builder: (context, child) => Stack(
          children: [
            child!,
            const EmojiLoader(),
          ],
        ),
      ),
    );
  }
}
