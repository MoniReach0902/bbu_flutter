import 'dart:ffi';

class LoginRes{
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;

  LoginRes({this.accessToken, this.tokenType, this.refreshToken, this.expiresIn});

  LoginRes.formJson(Map<dynamic, dynamic> json){
    this.accessToken=json["accessToken"];
    this.tokenType=json["tokenType"];
    this.refreshToken=json["refreshToken"];
    this.expiresIn=json["expiresIn"];

  }
  Map<dynamic,dynamic> toJson(){
    Map<dynamic,dynamic> map = Map();
    map["accessToken"] =this.accessToken;
    map["tokenType"]=this.tokenType;
    map["refreshToken"]=this.refreshToken;
    map["expiresIn"]=this.expiresIn;
    return map;
  }
}