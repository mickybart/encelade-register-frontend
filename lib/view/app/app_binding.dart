import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RemoteRegisterProvider());
  }
}