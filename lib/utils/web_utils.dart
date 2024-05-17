import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebUtils {
  static void setTitle(String title) async {
    Future.microtask(
      () {
        SystemChrome.setApplicationSwitcherDescription(
          ApplicationSwitcherDescription(
            label: title,
            primaryColor: Colors.black.value,
          ),
        );
      },
    );
  }
}
