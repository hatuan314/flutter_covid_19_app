import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncoviapp/blocs/blocs.dart';
import 'package:ncoviapp/ui/multi_screen.dart';
import 'package:ncoviapp/ui/views/views.dart';

int currentRoot = 1;

RouteFactory router() {
  return (RouteSettings settings) {
    Widget screen;

    if (currentRoot == 1) {
      currentRoot = 2;
      return MaterialPageRoute(builder: (context) {
        ScUtil.init(context, pWidth: 360, pHeight: 640);
        return SplashView();
      });
    }

    final args = settings.arguments as Map<String, dynamic> ?? {};

    // todo:  add screen route here
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) {
          ScUtil.init(context, pWidth: 360, pHeight: 640);
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeBloc(),
              ),
              BlocProvider(
                create: (context) => VietnamBloc()..add(GetVietnamNcovidDataEvent()),
              ),
              BlocProvider(
                create: (context) => WorldBloc()..add(GetWorldNcovidDataEvent()),
              ),
            ],
            child: HomeView(),
          );
        });
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  };
}
