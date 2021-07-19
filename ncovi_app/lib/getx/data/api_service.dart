import 'dart:developer';

import 'package:get/get.dart';
import 'package:ncoviapp/models/country/country.dart';
import 'package:ncoviapp/models/world/world.dart';

abstract class ApiService {
  Future<World> getCasesGlobal();
  Future<Country> getCasesVietnam();
}

class ApiServiceImpl extends GetConnect implements ApiService {

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://corona-virus-stats.herokuapp.com/api/v1/cases';
  }

  @override
  Future<World> getCasesGlobal() async {
    final response = await get('/general-stats');
    return World.fromJson(response.body);
  }

  @override
  Future<Country> getCasesVietnam() async {
    final response = await get('/countries-search?search=vietnam');
    log('>>>>>>>>>response: ${response.body}');
    return Country.fromJson(response.body);
  }
}