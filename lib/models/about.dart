import 'package:spioc_portfolio/models/models.dart';

class About {
  final List<Technology> technologies;
  final List<Hobby> hobbies;
  final List<Project> projects;
  final List<Certification> certifications;
  final List<SoftSkill> softSkills;

  About({
    required this.technologies,
    required this.hobbies,
    required this.projects,
    required this.certifications,
    required this.softSkills,
  });
}
