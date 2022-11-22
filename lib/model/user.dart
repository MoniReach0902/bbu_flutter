class User{
  int? id;
  String? username;
  String? email;
  String? phone;

  User({this.id, this.username, this.email, this.phone});

  toJsonData(){
    Map<String, dynamic> map =new Map();
    map['id']=this.id;
    map['username']=this.username;
    map['email']=this.email;
    map['phone']=this.phone;

    return map;
  }
}