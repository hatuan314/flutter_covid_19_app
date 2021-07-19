import 'package:flutter/material.dart';
import 'package:ncoviapp/getx/data/api_service.dart';
import 'package:ncoviapp/models/model.dart';

abstract class Repository {
  Future<World> getCaseGlobal();
  Future<Country> getCaseVietnam();
}

class RepositoryImpl implements Repository {
  final ApiService apiService;

  RepositoryImpl({@required this.apiService});

  @override
  Future<World> getCaseGlobal() => apiService.getCasesGlobal();

  @override
  Future<Country> getCaseVietnam() => apiService.getCasesVietnam();

}