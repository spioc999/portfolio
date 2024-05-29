import 'package:flutter/material.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/not_found/not_found_contracts.dart';

class NotFoundView extends BaseMvvmStatefulWidget {
  NotFoundView({super.key}) : super(_NotFoundViewState());
}

class _NotFoundViewState
    extends BaseState<NotFoundView, NotFoundViewModelContract, NotFoundState>
    implements NotFoundViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<NotFoundViewModelContract, NotFoundState>(
      model: viewModel,
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Center(
            child: Text('404'),
          ),
        );
      },
    );
  }
}
