import 'package:get/get.dart';
import 'package:ncoviapp/getx/ui/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}