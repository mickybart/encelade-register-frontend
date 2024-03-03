import 'package:encelade/controller/new_draft.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class NewDraftBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      NewDraftController(
        Get.find<RemoteRegisterProvider>(),
      ),
    );
  }
}
