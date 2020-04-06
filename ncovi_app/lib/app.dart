import 'package:flutter/material.dart';
import 'package:ncoviapp/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'AB',
      ),
      onGenerateRoute: router(),
    );
  }

}