import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/education/education_contracts.dart';

class EducationViewModel
    extends BaseViewModel<EducationViewContract, EducationState>
    implements EducationViewModelContract {
  final PersonalDataInteractor _personalDataInteractor;

  EducationViewModel({required PersonalDataInteractor personalDataInteractor})
      : _personalDataInteractor = personalDataInteractor;

  @override
  void onInitState() {
    super.onInitState();
    vmState.educations.addAll(_personalDataInteractor.educations);
  }
}
