import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/views/views.dart';

void setupLocatorViews() {
  getIt.registerFactory<HomeView>(
    HomeView.new,
  );

  getIt.registerFactory<NotFoundView>(
    NotFoundView.new,
  );
}
