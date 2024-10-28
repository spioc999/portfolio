import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class PersonalDataService {
  final Me _me;

  PersonalDataService({required Me me}) : _me = me;

  LocalizedString get role => _me.role;
  About get about => _me.about;
  Education get education => _me.education;
  Experience get experience => _me.experience;
}
