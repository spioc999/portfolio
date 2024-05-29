import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class EducationViewContract extends BaseViewContract {}

abstract class EducationViewModelContract
    extends BaseViewModelContract<EducationState, EducationViewContract> {}

class EducationState extends BaseVMState {}
