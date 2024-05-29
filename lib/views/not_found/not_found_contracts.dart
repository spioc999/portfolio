import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';

abstract class NotFoundViewContract extends BaseViewContract {}

abstract class NotFoundViewModelContract
    extends BaseViewModelContract<NotFoundState, NotFoundViewContract> {}

class NotFoundState extends BaseVMState {}
