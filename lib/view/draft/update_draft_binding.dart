import 'package:encelade/controller/record_flow/update_draft.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class UpdateDraftBinding extends Bindings {
  @override
  void dependencies() {
    Record record = Get.arguments;

    Get.put(
      UpdateDraftController(
        Get.find<RemoteRegisterProvider>(),
        record,
      ),
    );
  }
}
