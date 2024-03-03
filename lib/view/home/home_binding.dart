import 'package:encelade/controller/home.dart';
import 'package:encelade/model/remote_register_provider.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        Get.find<RemoteRegisterProvider>(),
      ),
    );
  }
}
