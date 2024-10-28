import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class AppMarkdown extends StatelessWidget {
  final String data;
  final Function(String)? onLinkTap;

  const AppMarkdown({
    super.key,
    required this.data,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      softLineBreak: true,
      listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.start,
      styleSheet: MarkdownStyleSheet(
        p: ResponsiveValues.themeBodyStyle(context),
        strong: ResponsiveValues.themeBodyStyle(context)?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        a: ResponsiveValues.themeBodyStyle(context)?.copyWith(
          decoration: TextDecoration.underline,
        ),
        em: ResponsiveValues.themeBodyStyle(context)?.copyWith(
          fontStyle: FontStyle.italic,
        ),
        textAlign: WrapAlignment.start,
        listBullet: ResponsiveValues.themeBodyStyle(context),
        listIndent: Dimens.defaultListIndent,
      ),
      onTapLink: (_, href, __) {
        if (href != null) onLinkTap?.call(href);
      },
    );
  }
}
