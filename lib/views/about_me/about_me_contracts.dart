import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class AboutMeViewContract extends BaseViewContract {}

abstract class AboutMeViewModelContract
    extends BaseViewModelContract<AboutMeState, AboutMeViewContract> {
  void onLetsCelebrateTap();
}

class AboutMeState extends BaseVMState {
  late String firstName;
  late String role;
  late int yearsOld;
  late bool isBirthdayToday;
}
