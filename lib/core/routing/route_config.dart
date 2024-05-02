import 'package:go_router/go_router.dart';

void initRouting({bool reflectsImperativeAPIs = true}) {
  GoRouter.optionURLReflectsImperativeAPIs = reflectsImperativeAPIs;
}
