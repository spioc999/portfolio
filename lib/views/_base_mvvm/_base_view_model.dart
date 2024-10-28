import 'package:flutter/material.dart';

import '_base_contracts.dart';

abstract class BaseViewModel<V extends BaseViewContract, S extends BaseVMState>
    extends ChangeNotifier implements BaseViewModelContract<S, V> {
  @override
  late V sourceView;

  @override
  late S vmState;

  void startLoadingState() {
    vmState.isLoading = true;
    notifyListeners();
  }

  void stopLoadingState() {
    vmState.isLoading = false;
    notifyListeners();
  }

  @override
  @mustCallSuper
  void onInitState() {}

  @override
  @mustCallSuper
  void onSourceViewReady() {}

  @override
  void onDispose() {}

  @override
  void failedToOpenUrl() {
    sourceView.showGeneralErrorToaster();
  }

  @override
  void onExternalUrlTap(String url) => sourceView.openExternalUrl(url);

  void handleError(
    dynamic exception, {
    String? content,
  }) {
    if (content != null) {
      sourceView.showErrorToaster(content);
      return;
    }
    sourceView.showGeneralErrorToaster();
  }
}
