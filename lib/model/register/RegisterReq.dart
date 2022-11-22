class RegisterReq {
  RegisterReq({
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.phoneNumber, 
      this.password, 
      this.confirmPassword, 
      this.nationalId, 
      this.dob, 
      this.deviceId,});

  RegisterReq.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    nationalId = json['nationalId'];
    dob = json['dob'];
    deviceId = json['deviceId'];
  }
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String? nationalId;
  String? dob;
  String? deviceId;

  Map<dynamic, dynamic> toJson() {
    final map = <dynamic, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['nationalId'] = nationalId;
    map['dob'] = dob;
    map['deviceId'] = deviceId;
    return map;
  }

}