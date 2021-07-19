import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/getx/domain/repository.dart';
import 'package:ncoviapp/models/model.dart';

import 'world_state.dart';

class WorldController extends GetxController {
  final Repository repository;
  Rx<WorldState> worldStateObs = WorldState(viewState: ViewState.loading).obs;

  WorldController({@required this.repository});

  @override
  Future<void> onInit() async {
    super.onInit();
    final World world = await repository.getCaseGlobal();
    worldStateObs.value.copyWith(world: world, viewState: ViewState.initial);
  }
}