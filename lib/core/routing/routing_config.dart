import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void initRouting({bool reflectsImperativeAPIs = true}) {
  GoRouter.optionURLReflectsImperativeAPIs = reflectsImperativeAPIs;
}
