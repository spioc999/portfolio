import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        routerConfig: routerConfig,
        builder: (context, child) {
          return Stack(
            children: [
              child!,
              const EmojiLoader(),
            ],
          );
        },
      ),
    );
  }
}
