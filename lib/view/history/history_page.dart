// An history page for the register
//
// Used to display a list of sub set records from the register
//
// Features supported:
// - Fitler based on a range of time and record states
// - PDF Sharing
// - PDF Printing
// - PDF Preview
// - Display details per record

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:encelade/controller/history.dart';
import 'package:encelade/translations/get_date_format.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:encelade/view/record/widgets/record_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryController> {
  HistoryPage({super.key}) {
    _onRefresh();
  }

  Future<void> _onRefresh() async {
    try {
      await controller.onRefresh();
    } on Exception catch (e) {
      showSnackbarErrorTo('hpp_sset_refresh'.tr, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hpp_title'.tr),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.validity.value ? _onRefresh : null,
              icon: const Icon(Icons.refresh),
              tooltip: 'tooltip_refresh'.tr,
            ),
          ),
          IconButton(
            onPressed: controller.pdf.onSharePdf,
            icon: const Icon(Icons.share),
            tooltip: 'tooltip_share_pdf'.tr,
          ),
          IconButton(
            onPressed: controller.pdf.onPrinting,
            icon: const Icon(Icons.print),
            tooltip: 'tooltip_print'.tr,
          ),
          IconButton(
            onPressed: controller.pdf.onPdfPreview,
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'tooltip_pdf'.tr,
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => ListTile(
              tileColor: Get.theme.highlightColor,
              title: Text(
                _startEndDates(),
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 16.0),
              ),
              subtitle: Wrap(
                spacing: 8.0,
                children: [
                  if (controller.stateCompleted.value)
                    Chip(
                      label: Text('hpp_completed'.tr),
                      avatar: const Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                    ),
                  if (controller.stateDraft.value)
                    Chip(
                      label: Text('hpp_draft'.tr),
                      avatar: const Icon(
                        Icons.drafts,
                        color: Colors.purple,
                      ),
                    ),
                  if (controller.stateOthers.value)
                    Chip(
                      label: Text('hpp_other'.tr),
                      avatar: const Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.records.isEmpty) {
                  return Center(
                    child: Text('hpp_empty'.tr),
                  );
                } else {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.records.length,
                    itemBuilder: (context, index) => RecordTile(
                      record: controller.records[index],
                      onTap: controller.onDetails,
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _historySettings,
        tooltip: 'tooltip_filter'.tr,
        child: const Icon(Icons.filter_list),
      ),
    );
  }

  String _startEndDates() {
    final dateFormat = GetDateFormat.yMMMMd();

    if (controller.range.length != 2) {
      return 'hpp_select_filter'.tr;
    }

    final startDate = dateFormat.format(controller.range[0]);
    final endDate = dateFormat.format(controller.range[1]);

    return '$startDate - $endDate';
  }

  String _startEndDatesForSettings() {
    final dateFormat = GetDateFormat.yMMMMd();
    final startDate = controller.settingsRange.isNotEmpty
        ? dateFormat.format(controller.settingsRange[0])
        : 'hpp_start_date'.tr;
    final endDate = controller.settingsRange.length == 2
        ? dateFormat.format(controller.settingsRange[1])
        : 'hpp_end_date'.tr;

    return '$startDate - $endDate';
  }

  void _historySettings() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _startEndDatesForSettings(),
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 16.0),
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                  firstDate: DateTime(2024),
                  lastDate: DateTime.now(),
                  selectedRangeHighlightColor:
                      controller.isSettingsRangeNotMoreThanMax
                          ? null
                          : Colors.red.shade200,
                  selectedDayHighlightColor:
                      controller.isSettingsRangeNotMoreThanMax
                          ? null
                          : Colors.red,
                ),
                value: controller.settingsRange,
                onValueChanged: (value) {
                  controller.settingsRange(value.nonNulls.toList());
                },
              ),
              SwitchListTile(
                value: controller.settingsStateCompleted.value,
                onChanged: (value) {
                  controller.settingsStateCompleted(value);
                },
                title: Text('hpp_show_completed'.tr),
              ),
              SwitchListTile(
                value: controller.settingsStateDraft.value,
                onChanged: (value) {
                  controller.settingsStateDraft(value);
                },
                title: Text('hpp_show_draft'.tr),
              ),
              SwitchListTile(
                value: controller.settingsStateOthers.value,
                onChanged: (value) {
                  controller.settingsStateOthers(value);
                },
                title: Text('hpp_show_other'.tr),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 16.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.onCancel,
                      icon: const Icon(Icons.cancel),
                      label: Text('hpp_cancel'.tr),
                    ),
                    ElevatedButton.icon(
                      onPressed: controller.isSettingsValid
                          ? () {
                              controller.onApplyFilter();
                              controller.onGoBack();
                              _onRefresh();
                            }
                          : null,
                      icon: const Icon(Icons.filter_list),
                      label: Text('hpp_apply'.tr),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Get.theme.dialogBackgroundColor,
      isScrollControlled: true,
    );
  }
}
