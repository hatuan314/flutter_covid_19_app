import 'package:ncoviapp/models/model.dart';
import 'package:ncoviapp/service/service.dart';

class Repository {
  Provider _provider = Provider();
  Future<Country> fetchVietnamNcovidData() => _provider.fetchVietnamNcovidData();
  Future<World> fetchWorldNcovidData() => _provider.fetchWorldNcovidData();
}