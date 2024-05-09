import 'package:encelade/controller/interfaces/i_remote_register_controller.dart';
import 'package:encelade/view/common/icon_progress.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordFlowAction {
  final String label;
  final String labelOnAction;
  final IconData iconData;
  final String errorToMsg;
  final Future<void> Function() onAction;

  RecordFlowAction(
    this.label,
    this.labelOnAction,
    this.iconData,
    this.errorToMsg,
    this.onAction,
  );
}

class ScaffoldRecordFlow extends StatelessWidget {
  /// A controller for this view
  final IRemoteRegisterController controller;

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The children of the scaffold.
  final List<Widget> children;

  /// Use a spacer between children and bottom actions
  final bool spacer;

  /// Primary Action settgins
  final RecordFlowAction primaryAction;

  const ScaffoldRecordFlow({
    super.key,
    required this.controller,
    this.appBar,
    required this.children,
    this.spacer = true,
    required this.primaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: controller.onPop,
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ...children,
              if (spacer) const Spacer(),
              Obx(
                () => Wrap(
                  spacing: 16.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.onCancel,
                      icon: const Icon(Icons.cancel),
                      label: const Text('Cancel'),
                    ),
                    ElevatedButton.icon(
                      onPressed: controller.validity.isFalse ||
                              controller.remoteCallInProgress.isTrue
                          ? null
                          : () async {
                              try {
                                await primaryAction.onAction();
                                controller.onGoBack();
                              } on Exception catch (e) {
                                showSnackbarErrorTo(
                                    primaryAction.errorToMsg, e);
                              }
                            },
                      label: controller.remoteCallInProgress.isFalse
                          ? Text(primaryAction.label)
                          : Text(primaryAction.labelOnAction),
                      icon: controller.remoteCallInProgress.isFalse
                          ? Icon(primaryAction.iconData)
                          : const IconProgress(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
