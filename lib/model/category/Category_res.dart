import 'Data.dart';

class CategoryRes {
  CategoryRes({
      this.message, 
      this.code, 
      this.data,});

  CategoryRes.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String ? message;
  String ? code;
  Data ? data;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}