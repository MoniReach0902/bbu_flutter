import 'package:example1/model/category/MenuList.dart';

class Data {
  Data({
    this.menuList,
  });

  Data.fromJson(dynamic json) {
    if (json['menuList'] != null) {
      menuList = [];
      json['menuList'].forEach((v) {
        menuList!.add(MenuList.fromJson(v));
      });
    }
  }
  List<MenuList> ? menuList;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (menuList != null) {
      map['menuList'] = menuList!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}
