import 'package:spioc_portfolio/utils/typedefs.dart';

class Experience {
  final LocalizedString role;
  final String company;
  final String companyUrl;
  final String? companyImageUrl;
  final LocalizedString? locality;
  final ExperienceWorkingType? workingType;
  final DateTime startDateTime;
  final DateTime? endDateTime;

  Experience({
    required this.role,
    required this.company,
    required this.companyUrl,
    this.companyImageUrl,
    required this.startDateTime,
    required this.endDateTime,
    this.locality,
    this.workingType,
  });

  bool get hasLocalityOrWorkingType => locality != null || workingType != null;
}

enum ExperienceWorkingType {
  remote,
  hybrid,
  inPresence,
  internship,
  summerWorkExperience
}

extension ExperienceWorkingTypeExt on ExperienceWorkingType {
  LocalizedString get label => switch (this) {
        ExperienceWorkingType.remote => (l10n) =>
            l10n.experienceworkingtype_remote_label,
        ExperienceWorkingType.hybrid => (l10n) =>
            l10n.experienceworkingtype_hybrid_label,
        ExperienceWorkingType.inPresence => (l10n) =>
            l10n.experienceworkingtype_inpresence_label,
        ExperienceWorkingType.internship => (l10n) =>
            l10n.experienceworkingtype_internship_label,
        ExperienceWorkingType.summerWorkExperience => (l10n) =>
            l10n.experienceworkingtype_summerworkexperience_label,
      };
}
