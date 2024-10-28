import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

class LocalizationUtils {
  static String getEnLocalizedString(
    LocalizedString locString,
  ) =>
      locString(AppLocalizationsEn());

  static String getEnParamLocalizedString(
    ParamLocalizedString parLocString,
    Map<String, dynamic> params,
  ) =>
      parLocString(AppLocalizationsEn(), params);
}
