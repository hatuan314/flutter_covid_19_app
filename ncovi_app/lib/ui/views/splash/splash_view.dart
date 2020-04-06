import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ncoviapp/ui/loading_view.dart';
import 'package:ncoviapp/ui/multi_screen.dart';
import 'package:ncoviapp/ui/views/splash/splash.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData().then((value) async {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  Future initData() async {
    await Future.delayed(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

//          Padding(
//            padding:
//                EdgeInsets.only(bottom: ScUtil.getInstance().setHeight(20)),
//            child: LoadingView(
//              dotRadius: 8.0,
//              radius: 25.0,
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}
