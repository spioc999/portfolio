import 'package:collection/collection.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/experience/experience_contracts.dart';

class ExperienceViewModel
    extends BaseViewModel<ExperienceViewContract, ExperienceState>
    implements ExperienceViewModelContract {
  final PersonalDataInteractor _personalDataInteractor;

  ExperienceViewModel({required PersonalDataInteractor personalDataInteractor})
      : _personalDataInteractor = personalDataInteractor;

  @override
  void onInitState() {
    super.onInitState();
    vmState.experiences.addAll(
      _personalDataInteractor.experiences.sortedByCompare<DateTime>(
        (e) => e.startDateTime,
        (d1, d2) => d2.compareTo(d1),
      ),
    );
    vmState.otherExperiences.addAll(
      _personalDataInteractor.otherExperiences.sortedByCompare<DateTime>(
        (e) => e.startDateTime,
        (d1, d2) => d2.compareTo(d1),
      ),
    );
  }
}
