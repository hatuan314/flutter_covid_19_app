import 'package:ncoviapp/models/country/rows.dart';

class Data {
  String lastUpdate;
  List<Row> rows;

  Data({this.lastUpdate, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['last_update'];
    if (json['rows'] != null) {
      rows = new List<Row>();
      json['rows'].forEach((v) {
        rows.add(new Row.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_update'] = this.lastUpdate;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}