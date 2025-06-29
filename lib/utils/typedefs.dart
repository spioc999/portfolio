import 'package:spioc_portfolio/l10n/generated/app_localizations.dart';

typedef LocalizedString = String Function(AppLocalizations);
typedef ParamLocalizedString = String Function(AppLocalizations, Map<String, dynamic>);
typedef Link = ({String url, LocalizedString? label});
