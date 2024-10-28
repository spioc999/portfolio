import 'package:flutter/material.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/routing_helper.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_contracts.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm_stateful_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseState<T extends BaseMvvmStatefulWidget,
        VM extends BaseViewModelContract, S extends BaseVMState>
    extends State<T> with TickerProviderStateMixin implements BaseViewContract {
  late VM _viewModel;
  VM get viewModel => _viewModel;
  S get vmState => _viewModel.vmState as S;

  AppLocalizations get l10n => AppLocalizations.of(context)!;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<VM>();
    _viewModel.vmState = getIt<S>();
    _viewModel.sourceView = this;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _viewModel.onSourceViewReady());
  }

  void showSuccessToaster(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void showErrorToaster(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, //TODO
      ),
    );
  }

  @override
  void clearTextFieldFocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  void showGeneralErrorToaster() {
    showErrorToaster(
      l10n.generic_error,
    );
  }

  @override
  void dismissScreen([dynamic result]) => RoutingHelper.pop(context, result);

  @override
  void openExternalUrl(String url, {bool isNewTab = true}) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: isNewTab ? '_blank' : '_self');
    } else {
      viewModel.failedToOpenUrl();
    }
  }
}
