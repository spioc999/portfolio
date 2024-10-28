import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScrollableView extends StatelessWidget {
  final Widget body;
  final bool withFooter;

  const PortfolioScrollableView({
    super.key,
    required this.body,
    this.withFooter = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: defaultScrollPhysics,
      slivers: [
        SliverPadding(
          padding: ResponsiveValues.bodyPadding(context),
          sliver: SliverToBoxAdapter(child: body),
        ),
        if (withFooter) const _PortfolioSliverFooter(),
      ],
    );
  }
}

class _PortfolioSliverFooter extends StatelessWidget {
  const _PortfolioSliverFooter();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppDivider.horizontal(height: Dimens.tightDividerThickness),
            Padding(
              padding: defaultHorizontalPadding.copyWith(
                top: Dimens.smallMargin,
                bottom: Dimens.smallMargin,
              ),
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: Theme.of(context).textTheme.labelSmall,
                  children: [
                    TextSpan(
                      text: l10n(context).generic_footer_label1,
                    ),
                    TextSpan(
                      text: technologyName,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(Uri.parse(technologyLink)),
                    ),
                    TextSpan(
                      text: l10n(context).generic_footer_label2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
