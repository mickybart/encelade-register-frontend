import 'package:encelade/controller/record_details.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:encelade/model/types/record.dart';
import 'package:get/get.dart';

class RecordDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final Record record = Get.arguments;

    Get.put(
      RecordDetailsController(
        Get.find<RemoteRegisterProvider>(),
        record,
      ),
    );
  }
  
}