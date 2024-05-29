import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_base_contracts.dart';

class BaseWidget<T extends BaseViewModelContract, S extends BaseVMState>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T model;
  final Widget? child;

  const BaseWidget({
    super.key,
    required this.model,
    required this.builder,
    this.child,
  });

  @override
  State<BaseWidget<T, S>> createState() => _BaseWidgetState<T, S>();
}

class _BaseWidgetState<T extends BaseViewModelContract, S extends BaseVMState>
    extends State<BaseWidget<T, S>> with WidgetsBindingObserver {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  late T model;

  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;
    model.onInitState();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    model.onDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
