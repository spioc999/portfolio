import 'package:spioc_portfolio/utils/typedefs.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class HomeViewContract extends BaseViewContract {
  void initializeImagesTimer();
}

abstract class HomeViewModelContract
    extends BaseViewModelContract<HomeState, HomeViewContract> {}

class HomeState extends BaseVMState {
  late final String firstName;
  late final String lastName;
  late final List<String> imageUrls;
  late final LocalizedString role;
}
