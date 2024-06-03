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
    vmState.intro = _personalDataInteractor.about.intro;
    vmState.yearsOld = _personalDataInteractor.yearsOld;
  }
}
