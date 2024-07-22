import 'package:spioc_portfolio/utils/typedefs.dart';

class Experience {
  final LocalizedString role;
  final String company;
  final DateTime startDateTime;
  final DateTime? endDateTime;

  Experience({
    required this.role,
    required this.company,
    required this.startDateTime,
    required this.endDateTime,
  });
}
