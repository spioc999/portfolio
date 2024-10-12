import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/about_me/about_me_contracts.dart';

class AboutMeViewModel extends BaseViewModel<AboutMeViewContract, AboutMeState>
    implements AboutMeViewModelContract {
  final PersonalDataInteractor _personalDataInteractor;

  AboutMeViewModel({required PersonalDataInteractor personalDataInteractor})
      : _personalDataInteractor = personalDataInteractor;

  @override
  void onInitState() {
    super.onInitState();
    vmState.firstName = _personalDataInteractor.firstName;
    vmState.yearsOld = _personalDataInteractor.yearsOld;
    vmState.isBirthdayToday = _personalDataInteractor.isBirthdayToday;

    final about = _personalDataInteractor.about;

    vmState.cvUrl = about.cvUrl;
    vmState.intro = about.intro;
    vmState.technologies.addAll(about.technologies);
    vmState.softSkills.addAll(about.softSkills);
    vmState.hobbies.addAll(about.hobbies);
    vmState.projects.addAll(about.projects);
    vmState.moreProjectsLink = _personalDataInteractor.projectsUrl;
    vmState.certifications.addAll(about.certifications);
  }

  @override
  void onLetsCelebrateTap() => sourceView.startLetsCelebrate();

  @override
  void onDownloadCvTap() async {
    _setIsDownloadingCv(true);

    await Future.delayed(Duration(seconds: 2));

    _setIsDownloadingCv(false);
  }

  void _setIsDownloadingCv(bool value) {
    vmState.isDownloadingCv = value;
    notifyListeners();
  }
}
