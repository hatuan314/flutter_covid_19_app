import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncoviapp/ui/multi_screen.dart';

class InfoTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFCFAF3),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Text('Covid-19 App', style: TextStyle(fontSize: ScUtil.getInstance().setSp(32)),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Powered by', style: TextStyle(fontSize: ScUtil.getInstance().setSp(11)),),
              Image.asset('assets/img/kit_logo.png', height: ScUtil.getInstance().setHeight(80),),
            ],
          )
        ],
      ),
    );
  }

}