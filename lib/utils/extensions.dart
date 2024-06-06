import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:spioc_portfolio/models/contact.dart';

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

extension ContactTypeExt on ContactType {
  IconData get icon => switch (this) {
        ContactType.github => SimpleIcons.github,
        ContactType.linkedin => SimpleIcons.linkedin,
        ContactType.instagram => SimpleIcons.instagram,
      };
}
