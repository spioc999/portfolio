import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';
import 'package:spioc_portfolio/modules/personal_data_service.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class PersonalDataInteractor {
  final PersonalDataService _personalData;

  PersonalDataInteractor({required PersonalDataService personalDataService})
      : _personalData = personalDataService;

  LocalizedString get role => _personalData.role;
  About get about => _personalData.about;
  Education get education => _personalData.education;
  Experience get experience => _personalData.experience;
}
