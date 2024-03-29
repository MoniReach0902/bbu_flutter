import 'dart:convert';

import 'package:example1/apis/api.dart';
import 'package:example1/model/category/Category_res.dart';
import 'package:example1/model/register/RegisterReq.dart';
import 'package:example1/model/req/login_req.dart';
import 'package:example1/model/res/RegisterRes.dart';
import 'package:example1/model/res/login_res.dart';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class ApiManager extends Apis{

  Future<LoginRes> login(LoginReq req) async {
    LoginRes res =  LoginRes();
    try {
      //make url
      var url = Uri.parse(baseUrl + loginUrl);
      //call to api using http
      var response = await http.post(
          url,
          headers: headers, body: jsonEncode(req.toJson()),
          encoding: Encoding.getByName("utf-8")
      );
      if(response.statusCode == 401){
        throw("Your phone number and password incorrect!");
      }

      if(null != response.body && response.body.isNotEmpty) {
        // map response to login res
        Map map = json.decode(response.body);
        res = LoginRes.formJson(map);
      }
    }catch(e){
      print("ERROR ${e}");
      throw("Internal server error");
    }
    return res;
  }




  Future<RegisterRes> register(RegisterReq registerReq) async {
    RegisterRes registerRes=RegisterRes();
    try{
      var url=Uri.parse(baseUrl + registerUrl);
      var respone=await http.post(url,
        headers: headers,body: jsonEncode(registerReq.toJson()),
          encoding: Encoding.getByName("utf-8")
      );
      if(respone.statusCode==200) {
        final resBody=jsonDecode(respone.body);
        registerRes=RegisterRes.fromJson(resBody);
        if(respone.statusCode==400){
          throw("${registerRes.data}");
        }
      }
    }catch(e){
      print(e);
    }
    return registerRes;
  }

  Future<CategoryRes> getAllCategory() async{
    CategoryRes res=CategoryRes();
    try{
      var url=Uri.parse(baseUrl+getCategoryUrl);
      var respone=await http.get(url,headers: headerWithToken(getToken()),
      );
      if(respone.statusCode==200){
        final responeMap=jsonDecode(utf8.decode(respone.bodyBytes));
        res=CategoryRes.fromJson(responeMap);
      }
    }catch(e){
      throw(e);
    }
    return res;
  }

  String getToken() {
    LoginRes res = LoginRes();
    final storage = LocalStorage("mobile_token_app");
    if (null != storage.getItem("data")) {
      res = LoginRes.formJson(storage.getItem("data"));
    }
    return res.accessToken!;
  }


}