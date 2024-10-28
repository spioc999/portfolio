import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/modules/modules.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/validation_utils.dart';

class PersonalDataInteractor {
  final PersonalDataService _personalData;
  final DateTimeService _dateTimeService;
  final FileService _fileService;

  PersonalDataInteractor({
    required PersonalDataService personalDataService,
    required DateTimeService dateTimeService,
    required FileService fileService,
  })  : _personalData = personalDataService,
        _dateTimeService = dateTimeService,
        _fileService = fileService;

  int get yearsOld =>
      _dateTimeService.localNow.difference(dateOfBirth).inDays ~/ 365;

  bool get isBirthdayToday =>
      _dateTimeService.localNow.isSameDayAndMonth(dateOfBirth);

  String get initials => _personalData.initials;
  String get firstName => _personalData.firstName;
  String get lastName => _personalData.lastName;
  String get fullName => _personalData.fullName;
  String get role => _personalData.role;

  List<Contact> get contacts => _personalData.contacts;
  String? get projectsUrl => _personalData.projectsUrl;
  List<String> get imageUrls => _personalData.imageUrls;
  DateTime get dateOfBirth => _personalData.dateOfBirth;

  About get about => _personalData.about;
  bool get hasCv => !isNullOrEmpty(about.cvUrl);

  List<Experience> get experiences => _personalData.experiences;
  List<Experience> get otherExperiences => _personalData.otherExperiences;

  List<Education> get educations => _personalData.educations;

  Future<void> downloadCvFile() => _fileService.openAssetFile(about.cvUrl!);
}
