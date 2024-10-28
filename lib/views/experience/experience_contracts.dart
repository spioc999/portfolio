import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class ExperienceViewContract extends BaseViewContract {}

abstract class ExperienceViewModelContract
    extends BaseViewModelContract<ExperienceState, ExperienceViewContract> {}

class ExperienceState extends BaseVMState {}
