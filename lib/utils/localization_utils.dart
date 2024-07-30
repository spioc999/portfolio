import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

class LocalizationUtils {
  static final _enLocal = AppLocalizationsEn();

  static String getEnLocalizedString(
    LocalizedString locString,
  ) =>
      locString(_enLocal);

  static String getEnParamLocalizedString(
    ParamLocalizedString parLocString,
    Map<String, dynamic> params,
  ) =>
      parLocString(_enLocal, params);
}
