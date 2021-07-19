import 'package:get/get.dart';
import 'package:ncoviapp/getx/common/bindings/home_binding.dart';
import 'package:ncoviapp/getx/common/bindings/splash_binding.dart';
import 'package:ncoviapp/getx/ui/home/home_view.dart';
import 'package:ncoviapp/getx/ui/splash/splash_view.dart';

part 'routes.dart';

class GetPages {
  static final initial = RouteList.splash;

  static final routes = [
    GetPage(name: RouteList.splash, page: () => SplashView(), binding: SplashBinding()),
    GetPage(name: RouteList.home, page: () => HomeView(), binding: HomeBinding()),
    // GetPage(name: RouteList.home, page: page)
  ];
}
