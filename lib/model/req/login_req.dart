class LoginReq{
  String? phoneNumber;
  String? password;

  LoginReq({this.phoneNumber, this.password});

  toJson(){
    Map<String, dynamic> map = Map();
    map["phoneNumber"]= this.phoneNumber;
    map["password"]= this.password;
    return map;
  }
}