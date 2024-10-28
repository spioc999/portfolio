import 'package:spioc_portfolio/models/models.dart';

class PersonalDataService {
  final Me _me;

  PersonalDataService({required Me me}) : _me = me;

  String get initials => _me.initials;
  String get firstName => _me.firstName;
  String get lastName => _me.lastName;
  String get role => _me.role;

  List<Contact> get contacts => _me.contacts;
  String? get projectsUrl => _me.projectsUrl;
  List<String> get imageUrls => _me.imageUrls;
  String get fullName => _me.fullName;
  DateTime get dateOfBirth => _me.dateOfBirth;

  About get about => _me.about;

  List<Experience> get experiences => _me.experiences;
  List<Experience> get otherExperiences => _me.otherExperiences;

  List<Education> get educations => _me.educations;
}
