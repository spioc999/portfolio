import 'package:flutter/material.dart';

import 'base_state.dart';

abstract class BaseMvvmStatefulWidget extends StatefulWidget {
  const BaseMvvmStatefulWidget(this.state, {super.key});

  final BaseState state;

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return state;
  }
}
