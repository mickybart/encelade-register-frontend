import 'package:encelade/controller/record_flow/signature.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class SignatureBinding extends Bindings {
  @override
  void dependencies() {
    final Record record = Get.arguments;

    Get.put(
      SignatureController(
        Get.find<RemoteRegisterProvider>(),
        record,
      ),
    );
  }
}
