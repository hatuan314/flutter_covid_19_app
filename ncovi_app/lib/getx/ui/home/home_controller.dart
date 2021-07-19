import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<int> selectTab;

  HomeController();

  void changeTabEvent(int index) {
    selectTab.value = index;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    selectTab = 0.obs;
  }
}