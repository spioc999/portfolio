// Common Widgets

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

const emptyWidget = SizedBox();
const emptyString = '';
const whitespaceString = ' ';

const technologyName = 'Flutter';
const technologyLink = 'https://flutter.dev/';

void emptyCallback() {}

const ScrollPhysics defaultScrollPhysics = ClampingScrollPhysics();

const defaultHorizontalPadding =
    EdgeInsets.symmetric(horizontal: Dimens.horizontalPaddingDefault);

const defaultBorderRadius = BorderRadius.all(Radius.circular(
  Dimens.defaultRadius,
));

const defaultBodyPadding = EdgeInsets.symmetric(
  horizontal: Dimens.horizontalPaddingDefault,
  vertical: Dimens.verticalPaddingDefault,
);
const tabletBodyPadding = EdgeInsets.symmetric(
  horizontal: Dimens.horizontalPaddingTablet,
  vertical: Dimens.verticalPaddingDefault,
);
const desktopBodyPadding = EdgeInsets.symmetric(
  horizontal: Dimens.horizontalPaddingDesktop,
  vertical: Dimens.verticalPaddingDefault,
);

const defaultChipPadding = EdgeInsets.symmetric(
  vertical: Dimens.verticalPaddingChip,
  horizontal: Dimens.horizontalPaddingChip,
);

const verySmallMarginGap = Gap(Dimens.verySmallMargin);
const smallMarginGap = Gap(Dimens.smallMargin);
const defaultMarginGap = Gap(Dimens.defaultMargin);
const largeMarginGap = Gap(Dimens.largeMargin);
const veryLargeMarginGap = Gap(Dimens.veryLargeMargin);
const extraLargeMarginGap = Gap(Dimens.extraLargeMargin);
const gigantMarginGap = Gap(Dimens.gigantMargin);
