import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef LocalizedString = String Function(AppLocalizations);
typedef ParamLocalizedString = String Function(
  AppLocalizations,
  Map<String, dynamic>,
);
typedef Link = (String link, String? label);
