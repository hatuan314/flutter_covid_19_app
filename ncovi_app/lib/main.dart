import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncoviapp/getx/get_app.dart';

import 'app.dart';
import 'blocs/blocs.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  // runApp(MyApp());
  runApp(GetMyApp());
}
