import 'package:get/get.dart';
import 'package:ncoviapp/getx/data/api_service.dart';
import 'package:ncoviapp/getx/domain/repository.dart';
import 'package:ncoviapp/getx/ui/home/home_controller.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/vietnam_controller.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/world_controller.dart';
import 'package:ncoviapp/getx/ui/splash/splash_controller.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    // /// Controller
    // Get.lazyPut(() => SplashController());
    // Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => VietnamController(repository: Get.find()));
    // Get.lazyPut(() => WorldController(repository: Get.find()));

    /// Repository
    Get.lazyPut<Repository>(() => RepositoryImpl(apiService: Get.find()));

    /// DataSource
    Get.lazyPut<ApiService>(() => ApiServiceImpl());
  }
}
