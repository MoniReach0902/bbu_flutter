class MenuList {
  MenuList({
      this.id, 
      this.name, 
      this.nameKh, 
      this.route, 
      this.index, 
      this.imageUrl, 
      this.status, 
      this.categoryCode,});

  MenuList.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameKh = json['nameKh'];
    route = json['route'];
    index = json['index'];
    imageUrl = json['imageUrl'];
    status = json['status'];
    categoryCode = json['categoryCode'];
  }
  int ? id;
  String ? name;
  String ? nameKh;
  String ? route;
  int ? index;
  String ? imageUrl;
  String ? status;
  String ? categoryCode;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameKh'] = nameKh;
    map['route'] = route;
    map['index'] = index;
    map['imageUrl'] = imageUrl;
    map['status'] = status;
    map['categoryCode'] = categoryCode;
    return map;
  }

}