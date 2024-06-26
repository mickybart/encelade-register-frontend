import 'package:encelade/controller/pdf/history_pdf.dart';
import 'package:encelade/controller/interfaces/i_remote_register_controller.dart';
import 'package:encelade/model/types/record.dart';
import 'package:encelade/model/types/record_state.dart';
import 'package:encelade/view/app/navigation.dart';
import 'package:get/get.dart';

class HistoryController extends IRemoteRegisterController {
  final records = <Record>[].obs;
  final stateCompleted = false.obs;
  final stateDraft = false.obs;
  final stateOthers = false.obs;
  final range = <DateTime>[].obs;
  static const maxRangeInDays = 14;

  final settingsStateCompleted = true.obs;
  final settingsStateDraft = false.obs;
  final settingsStateOthers = false.obs;
  final settingsRange = _initialRange().obs;

  final HistoryPdfController pdf;

  HistoryController(super.remoteRegisterProvider, this.pdf);

  @override
  void onInit() {
    onApplyFilter();
    super.onInit();
  }

  bool get isSettingsValid {
    return (settingsStateCompleted.value ||
            settingsStateDraft.value ||
            settingsStateOthers.value) &&
        isSettingsRangeNotMoreThanMax &&
        settingsRange.length == 2;
  }

  bool get isSettingsRangeNotMoreThanMax {
    if (settingsRange.length != 2) {
      return true;
    }

    final diff = settingsRange[1].difference(settingsRange[0]);

    return diff.inDays < 14;
  }

  void onDetails(Record record) {
    Get.toNamed(Routes.details, arguments: record);
  }

  void onApplyFilter() {
    if (!isSettingsValid) {
      return;
    }

    range.value = settingsRange;
    pdf.range = settingsRange;
    stateCompleted.value = settingsStateCompleted.value;
    stateDraft.value = settingsStateDraft.value;
    stateOthers.value = settingsStateOthers.value;

    validity((stateCompleted.value || stateDraft.value || stateOthers.value) &&
        range.length == 2);
  }

  Future<void> onRefresh() async {
    if (remoteCallInProgress.value || !validity.value) {
      return;
    }

    final states = [
      if (stateDraft.value) RecordState.draft,
      if (stateOthers.value) ...[
        RecordState.created,
        RecordState.collectClientInside,
        RecordState.collectClientSignature,
        RecordState.collectClientOutside,
        RecordState.collectPqrsSignature,
        RecordState.returnClientInside,
        RecordState.returnClientSignature,
        RecordState.returnClientOutside,
        RecordState.returnPqrsSignature
      ],
      if (stateCompleted.value) RecordState.completed,
    ];

    // last day is included so we need to add 1 day
    final rangefilter = [
      range[0],
      range[1].add(const Duration(
          hours: 23, minutes: 59, seconds: 59, milliseconds: 999))
    ];

    await onRemoteCallAction(
      () async {
        records.clear();
        pdf.records.clear();
        await for (var record
            in remoteRegisterProvider.getRecords(states, rangefilter)) {
          records.add(record);
          pdf.records.add(record);
        }
      },
    );
  }
}

List<DateTime> _initialRange() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  return [today, today];
}
