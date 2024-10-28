import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class AboutMeViewContract extends BaseViewContract {}

abstract class AboutMeViewModelContract
    extends BaseViewModelContract<AboutMeState, AboutMeViewContract> {}

class AboutMeState extends BaseVMState {}
