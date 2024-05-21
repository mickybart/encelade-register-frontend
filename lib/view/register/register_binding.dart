import 'package:encelade/controller/register.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(
      RegisterController(
        Get.find<RemoteRegisterProvider>(),
      ),
    );
  }
}
