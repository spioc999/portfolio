import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spioc_portfolio/core/routing/route_names.dart';

class RoutingHelper {
  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      context.pop<T>(result);

  static void goNamed<T extends Object?>(
    BuildContext context,
    RouteName routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        routeName.name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
}
