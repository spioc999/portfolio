import 'package:spioc_portfolio/models/models.dart';

class About {
  final List<Technology> technologies;
  final List<SoftSkill> softSkills;
  final List<Hobby> hobbies;
  final List<Project> projects;
  final List<Certification> certifications;

  About({
    required this.technologies,
    required this.softSkills,
    required this.hobbies,
    required this.projects,
    required this.certifications,
  });
}
