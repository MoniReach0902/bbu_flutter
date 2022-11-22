class RegisterRes {
  RegisterRes({
      this.message, 
      this.code, 
      this.data,});

  RegisterRes.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    data = json['data'];
  }
  String? message;
  String? code;
  String? data;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['data'] = data;
    return map;
  }

}