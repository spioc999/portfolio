import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => PlaceholderProvider(),
  ),
];

class PlaceholderProvider extends ChangeNotifier {}
