import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutingHelper {
  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      context.pop<T>(result);
}
