import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class HomeViewContract extends BaseViewContract {}

abstract class HomeViewModelContract
    extends BaseViewModelContract<HomeState, HomeViewContract> {}

class HomeState extends BaseVMState {
  late final LocalizedString role;
}
