import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class AboutMeViewContract extends BaseViewContract {
  void startLetsCelebrate();
}

abstract class AboutMeViewModelContract
    extends BaseViewModelContract<AboutMeState, AboutMeViewContract> {
  void onLetsCelebrateTap();
  void onLinkTap(String url);
}

class AboutMeState extends BaseVMState {
  late String firstName;
  late String role;
  late int yearsOld;
  late ParamLocalizedString intro;

  late bool isBirthdayToday;

  List<Technology> technologies = [];
  List<SoftSkill> softSkills = [];
  List<Hobby> hobbies = [];
  List<Project> projects = [];
  String? moreProjectsLink;
  List<Certification> certifications = [];
}
