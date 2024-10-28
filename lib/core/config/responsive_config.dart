import 'package:responsive_builder/responsive_builder.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

void initResponsive() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(
      desktop: Dimens.desktopBreakpoints,
      tablet: Dimens.tableBreakpoints,
      watch: Dimens.watchBreakpoints,
    ),
    //Refined breakpoints not needed at the moment
  );
}
