import 'package:spioc_portfolio/l10n/generated/app_localizations_en.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class LocalizationUtils {
  static final _enLocal = AppLocalizationsEn();

  static String getEnLocalizedString(LocalizedString locString) => locString(_enLocal);

  static String getEnParamLocalizedString(ParamLocalizedString parLocString, Map<String, dynamic> params) =>
      parLocString(_enLocal, params);
}
