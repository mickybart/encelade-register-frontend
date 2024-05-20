import 'package:encelade/controller/record_flow/inside_outside.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class InsideOutsideBinding extends Bindings {
  @override
  void dependencies() {
    final Record record = Get.arguments;

    Get.put(
      InsideOutsideController(
        Get.find<RemoteRegisterProvider>(),
        record,
      ),
    );
  }
}
