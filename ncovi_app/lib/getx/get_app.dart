import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ncoviapp/getx/common/bindings/injector.dart';
import 'package:ncoviapp/getx/get_pages.dart';

import '../ui/multi_screen.dart';

class GetMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'AB',
      ),
      builder: (context, child) {
        ScUtil.init(context, pWidth: 360, pHeight: 640);
        return child;
      },
      smartManagement: SmartManagement.onlyBuilder,
      initialBinding: Injector(),
      initialRoute: GetPages.initial,
      getPages: GetPages.routes,
    );
  }
}
