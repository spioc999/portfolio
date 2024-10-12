import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class About {
  final String? cvUrl;
  final ParamLocalizedString intro;
  final List<Technology> technologies;
  final List<SoftSkill> softSkills;
  final List<Hobby> hobbies;
  final List<Project> projects;
  final List<Certification> certifications;

  About({
    this.cvUrl,
    required this.intro,
    required this.technologies,
    required this.softSkills,
    required this.hobbies,
    required this.projects,
    required this.certifications,
  });
}
