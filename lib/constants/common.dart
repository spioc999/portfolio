// Common Widgets

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

const emptyWidget = SizedBox();
const emptyString = '';

const technologyName = 'Flutter';
const technologyLink = 'https://flutter.dev/';

void emptyCallback() {}

const ScrollPhysics defaultScrollPhysics = ClampingScrollPhysics();

const defaultHorizontalPadding =
    EdgeInsets.symmetric(horizontal: Dimens.horizontalPaddingDefault);

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

const smallMarginGap = Gap(Dimens.smallMargin);
const defaultMarginGap = Gap(Dimens.defaultMargin);
const largeMarginGap = Gap(Dimens.largeMargin);
const veryLargeMarginGap = Gap(Dimens.veryLargeMargin);
