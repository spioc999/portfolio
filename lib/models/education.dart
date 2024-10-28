import 'package:spioc_portfolio/utils/localization_utils.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class Education {
  final LocalizedString degree;
  final LocalizedString institute;
  final String instituteUrl;
  final String? instituteImageUrl;
  final LocalizedString? locality;
  final DateTime startDateTime;
  final DateTime? endDateTime;

  Education({
    required this.degree,
    required this.institute,
    required this.instituteUrl,
    this.instituteImageUrl,
    required this.startDateTime,
    required this.endDateTime,
    this.locality,
  });

  String get identifier =>
      '${LocalizationUtils.getEnLocalizedString(degree)}@${LocalizationUtils.getEnLocalizedString(institute)}';
}
