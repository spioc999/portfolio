import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension StateExt on State {
  AppLocalizations? get maybeL10n => AppLocalizations.of(context);
  AppLocalizations get l10n => maybeL10n!;
}

extension WidgetExt on Widget {
  AppLocalizations? maybeL10n(BuildContext context) =>
      AppLocalizations.of(context);
  AppLocalizations l10n(BuildContext context) => maybeL10n(context)!;
}

extension DateTimeExt on DateTime {
  bool isSameDayAndMonth(DateTime other) =>
      month == other.month && day == other.day;
}

extension NavigatorGlobalKeyExt on GlobalKey<NavigatorState> {
  String? get currentRouteName {
    String? currentRoute;
    currentState?.popUntil((route) {
      currentRoute = route.settings.name;
      return true;
    });
    return currentRoute;
  }
}
