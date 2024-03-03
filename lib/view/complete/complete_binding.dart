import 'package:encelade/controller/complete.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class CompleteBinding extends Bindings {
  @override
  void dependencies() {
    final Record record = Get.arguments;

    Get.put(
      CompleteController(
        Get.find<RemoteRegisterProvider>(),
        record,
      ),
    );
  }
}
