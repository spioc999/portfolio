import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class AboutMeViewContract extends BaseViewContract {
  void startLetsCelebrate();
}

abstract class AboutMeViewModelContract
    extends BaseViewModelContract<AboutMeState, AboutMeViewContract> {
  void onLetsCelebrateTap();
  void onDownloadCvTap();
}

class AboutMeState extends BaseVMState {
  late bool hasCv;
  late String firstName;
  late int yearsOld;
  late ParamLocalizedString intro;

  late bool isBirthdayToday;

  final List<Technology> technologies = [];
  final List<SoftSkill> softSkills = [];
  final List<Hobby> hobbies = [];
  final List<Project> projects = [];
  String? moreProjectsLink;
  final List<Certification> certifications = [];
}
