import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/home/home_view.dart';

void setupLocatorViews() {
  getIt.registerFactory<HomeView>(
    HomeView.new,
  );
}
