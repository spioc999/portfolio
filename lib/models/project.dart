import 'package:flutter/material.dart';
import 'package:spioc_portfolio/utils/typedefs.dart';

class Project {
  final String title;
  final LocalizedString description;
  final List<Link> links;
  final List<IconData> techIcons;

  Project({
    required this.title,
    required this.description,
    required this.links,
    required this.techIcons,
  });
}
