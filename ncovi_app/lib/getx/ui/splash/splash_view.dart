import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ncoviapp/getx/ui/splash/splash_controller.dart';
import 'package:ncoviapp/ui/multi_screen.dart';
import 'package:ncoviapp/ui/views/splash/splash.dart';

class SplashView extends GetWidget<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffCB0606),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(
              'assets/img/welcome_background.png',
              fit: BoxFit.fill,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: ScUtil.getInstance().setHeight(90),),
                SvgPicture.asset('assets/img/icons/ic_vn_star.svg',color: Color(0xffFFD800), height: ScUtil.getInstance().setHeight(120)),
                SizedBox(height: ScUtil.getInstance().setHeight(60),),
                Box()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
