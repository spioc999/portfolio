import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum RouteName {
  home,
  aboutMe,
  experience,
  education,
  notFound,
}

extension RouteNameExt on RouteName {
  static List<RouteName> pages = [
    RouteName.aboutMe,
    RouteName.experience,
    RouteName.education,
  ];

  String get path => switch (this) {
        RouteName.home => "/",
        RouteName.aboutMe => "/about",
        RouteName.experience => "/experience",
        RouteName.education => "/education",
        RouteName.notFound => "NOT-FOUND",
      };

  String? title(BuildContext context) => switch (this) {
        RouteName.aboutMe => AppLocalizations.of(context)?.aboutmeview_title,
        RouteName.experience =>
          AppLocalizations.of(context)?.experienceview_title,
        RouteName.education =>
          AppLocalizations.of(context)?.educationview_title,
        RouteName.notFound => AppLocalizations.of(context)?.notfoundview_title,
        _ => null,
      };
}
