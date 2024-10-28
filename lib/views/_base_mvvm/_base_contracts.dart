import 'package:flutter/material.dart';

abstract class BaseViewContract {
  void showGeneralErrorToaster();
  void showErrorToaster(String content);
  void clearTextFieldFocus();
  void dismissScreen();
  void openExternalUrl(String url, {bool isNewTab});
}

abstract class BaseViewModelContract<S extends BaseVMState,
    V extends BaseViewContract> extends ChangeNotifier {
  late S vmState;
  late V sourceView;

  void onInitState();
  void onSourceViewReady();
  void onDispose();
  void tapOnRetry();
  void failedToOpenUrl();
}

abstract class BaseVMState {
  bool isLoading = false;
  bool hasError = false;
}
