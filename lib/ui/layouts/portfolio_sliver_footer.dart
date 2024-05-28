import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSliverFooter extends StatelessWidget {
  const PortfolioSliverFooter({super.key});

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
            const AppDivider.horizontal(height: 0.5),
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
                      text: AppLocalizations.of(context)!.generic_footer_label1,
                    ),
                    TextSpan(
                      text: technologyName,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(Uri.parse(technologyLink)),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.generic_footer_label2,
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
