import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/getx/domain/repository.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/vietnam_state.dart';
import 'package:ncoviapp/models/country/country.dart';

class VietnamController extends GetxController {
  final Repository repository;

  Rx<VietnamState> vnState;

  VietnamController({@required this.repository});
  @override
  Future<void> onInit() async {
    super.onInit();
    vnState = VietnamState(
      country: Country(),
      viewState: ViewState.loading,
    ).obs;
    final Country country = await repository.getCaseVietnam();
    vnState.value = vnState.value.copyWith(country: country, viewState: ViewState.initial);
  }
}