import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/home/home_contracts.dart';

class HomeViewModel extends BaseViewModel<HomeViewContract, HomeState>
    implements HomeViewModelContract {
  final PersonalDataInteractor _personalDataInteractor;

  HomeViewModel({required PersonalDataInteractor personalDataInteractor})
      : _personalDataInteractor = personalDataInteractor;

  @override
  void onInitState() {
    super.onInitState();
    vmState.role = _personalDataInteractor.role;
  }
}
