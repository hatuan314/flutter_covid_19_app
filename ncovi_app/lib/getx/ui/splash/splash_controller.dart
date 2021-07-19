import 'package:get/get.dart';
import 'package:ncoviapp/getx/get_pages.dart';

class SplashController extends GetxController {
  Future initData() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData().then((value) async {
      Get.toNamed(RouteList.home);
    });
  }
}