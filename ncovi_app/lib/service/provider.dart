import 'package:ncoviapp/models/model.dart';
import 'package:ncoviapp/service/service.dart';

class Provider {
  final _baseService = WebService();

  Future<Country> fetchVietnamNcovidData() async {
    final url = '/countries-search?search=vietnam';
    final dio = _baseService.setupDio();
    final response = await dio.get(url);
    var json = response.data;
    Country ncovid = Country.fromJson(json);
    dio.close();
    return ncovid;
  }

  Future<World> fetchWorldNcovidData() async {
    final url = '/general-stats';
    final dio = _baseService.setupDio();
    final response = await dio.get(url);
    var json = response.data;
    World ncovid = World.fromJson(json);
    dio.close();
    return ncovid;
  }
}