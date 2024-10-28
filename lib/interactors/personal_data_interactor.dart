import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class PersonalDataInteractor {
  final PersonalDataService _personalData;
  final DateTimeService _dateTimeService;

  PersonalDataInteractor({
    required PersonalDataService personalDataService,
    required DateTimeService dateTimeService,
  })  : _personalData = personalDataService,
        _dateTimeService = dateTimeService;

  int get yearsOld =>
      _dateTimeService.localNow.difference(dateOfBirth).inDays ~/ 365;

  bool get isBirthdayToday =>
      _dateTimeService.localNow.isSameDayAndMonth(_personalData.dateOfBirth);

  String get initials => _personalData.initials;
  String get firstName => _personalData.firstName;
  String get lastName => _personalData.lastName;
  String get fullName => _personalData.fullName;
  List<Contact> get contacts => _personalData.contacts;
  List<String> get imageUrls => _personalData.imageUrls;
  DateTime get dateOfBirth => _personalData.dateOfBirth;

  LocalizedString get role => _personalData.role;
  About get about => _personalData.about;
  Education get education => _personalData.education;
  Experience get experience => _personalData.experience;
}
