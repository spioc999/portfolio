import 'package:spioc_portfolio/models/models.dart';

class Me {
  final String initials;
  final String firstName;
  final String lastName;
  final String role;
  final List<Contact> contacts;
  final DateTime dateOfBirth;
  final List<String> imageUrls;

  final About about;
  final Education education;
  final Experience experience;

  Me({
    required this.initials,
    required this.firstName,
    required this.lastName,
    required this.contacts,
    required this.dateOfBirth,
    required this.imageUrls,
    required this.role,
    required this.about,
    required this.education,
    required this.experience,
  });

  String get fullName => '$firstName $lastName';
}
