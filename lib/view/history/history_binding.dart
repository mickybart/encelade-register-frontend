import 'package:encelade/controller/history.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HistoryController(
        Get.find<RemoteRegisterProvider>(),
      ),
    );
  }
}
