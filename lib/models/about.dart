import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class About {
  final ParamLocalizedString intro;
  final List<Technology> technologies;
  final List<SoftSkill> softSkills;
  final List<Hobby> hobbies;
  final List<Certification> certifications;
  final List<Project> projects;

  About({
    required this.intro,
    required this.technologies,
    required this.softSkills,
    required this.hobbies,
    required this.certifications,
    required this.projects,
  });
}
