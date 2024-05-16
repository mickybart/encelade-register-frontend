import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:encelade/controller/history.dart';
import 'package:encelade/view/common/snackbar.dart';
import 'package:encelade/view/record/record_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryPage extends GetView<HistoryController> {
  HistoryPage({super.key}) {
    _onRefresh();
  }

  Future<void> _onRefresh() async {
    try {
      await controller.onRefresh();
    } on Exception catch (e) {
      showSnackbarErrorTo('refresh filter', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.validity.value ? _onRefresh : null,
              icon: const Icon(Icons.refresh),
            ),
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
                    const Chip(
                      label: Text('Completed'),
                      avatar: Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                    ),
                  if (controller.stateDraft.value)
                    const Chip(
                      label: Text('Draft'),
                      avatar: Icon(
                        Icons.drafts,
                        color: Colors.purple,
                      ),
                    ),
                  if (controller.stateOthers.value)
                    const Chip(
                      label: Text('Others'),
                      avatar: Icon(
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
                  return const Center(
                    child: Text('No records...'),
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
        child: const Icon(Icons.filter_list),
      ),
    );
  }

  String _startEndDates() {
    final dateFormat = DateFormat.yMMMMd();

    if (controller.range.length != 2) {
      return 'Please select a filter !';
    }

    final startDate = dateFormat.format(controller.range[0]);
    final endDate = dateFormat.format(controller.range[1]);

    return '$startDate - $endDate';
  }

  String _startEndDatesForSettings() {
    final dateFormat = DateFormat.yMMMMd();
    final startDate = controller.settingsRange.isNotEmpty
        ? dateFormat.format(controller.settingsRange[0])
        : 'Start Date';
    final endDate = controller.settingsRange.length == 2
        ? dateFormat.format(controller.settingsRange[1])
        : 'End Date';

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
                title: const Text('Show completed records'),
              ),
              SwitchListTile(
                value: controller.settingsStateDraft.value,
                onChanged: (value) {
                  controller.settingsStateDraft(value);
                },
                title: const Text('Show draft records'),
              ),
              SwitchListTile(
                value: controller.settingsStateOthers.value,
                onChanged: (value) {
                  controller.settingsStateOthers(value);
                },
                title: const Text('Show all others records'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 16.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: controller.onCancel,
                      icon: const Icon(Icons.cancel),
                      label: const Text('cancel'),
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
                      label: const Text('apply'),
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
