import 'package:get/get.dart';
import 'package:ncoviapp/getx/ui/home/home_controller.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/vietnam_controller.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/world_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => VietnamController(repository: Get.find()));
    Get.lazyPut(() => WorldController(repository: Get.find()));
  }

}