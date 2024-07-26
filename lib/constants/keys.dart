class HomeKeys {}

class AboutMeKeys {
  static const introSection = 'aboutMe_introSection';
  static const letsCelebrateLabel = 'aboutMe_letsCelebrateLabel';
  static const techStackSection = 'aboutMe_techStackSection';
  static const softSkillsSection = 'aboutMe_softSkillsSection';
  static const hobbiesSection = 'aboutMe_hobbiesSection';
  static const projectsSection = 'aboutMe_projectsSection';
  static const certificationsSection = 'aboutMe_certificationsSection';
}

class ExperienceKeys {
  static String item(String position, String company) =>
      'experience_item_$position@$company';
  static String otherItem(String position, String company) =>
      'experience_otherItem_$position@$company';
}
