import 'package:easy_localization/easy_localization.dart';
import 'package:example1/apis/api_manager.dart';
import 'package:example1/fcm/get_fcm.dart';
import 'package:example1/model/req/login_req.dart';
import 'package:example1/page/home_page.dart';
import 'package:example1/screen/register_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';

import '../local_notification/local_notification.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool hide =true;
  bool isLoading = false;
  var phone='070902209';
  var pass='12345678';
  Future<void> _incrementCounter()  async {
    String? fcmKey = await getFcmToken();
    print('FCM Key : $fcmKey');

  }

  @override
  Widget build(BuildContext context) {
    LocalNotification.initialize();
    // For Forground State
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
    });
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(


          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                width: 80,
                height: 120,
                child: Image(
                  image: NetworkImage("https://bbu.edu.kh/ckfinder/userfiles/images/big_bbu_logo.jpg"),
                ),
              ),
              Column(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(10),
                      child:this.isLoading == false? Text("") :
                      Center(child: CircularProgressIndicator ())),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20, right: 20),

                    child: Center(
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter phone number";
                          }
                        },
                        controller: TextEditingController(text: '070902209'),
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            hintText: ' @គណនីប្រើប្រាស់',
                            hintStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontFamily: KhmerFonts.koulen,
                                package: 'khmer_fonts'),
                            fillColor: Colors.blueGrey,
                            focusColor: Colors.blueGrey,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 10,
                                ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Center(
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter phone number";
                          }
                        },
                        controller: TextEditingController(text: '12345678'),
                        obscureText: hide,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(

                            hintText: 'លេខសង្ងាត់ ',
                            hintStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontFamily: KhmerFonts.koulen,
                                package: 'khmer_fonts'),
                            fillColor: Colors.blueGrey,
                            focusColor: Colors.blueGrey,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hide=!hide;
                                });

                              },
                              icon:Icon(hide?Icons.visibility_off:Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 10,
                                ))),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.blue.withOpacity(0.9),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey.withOpacity(0.4),Colors.blueGrey,Colors.blueGrey.withOpacity(0.4)],
                      // stops: [0.8,0.5],
                    )
                ),
                child: TextButton(
                  onPressed: ()   {
                    login();
                    _incrementCounter();
                  },
                  child: Text(
                    "login".tr(),
                    style: TextStyle(

                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'ភ្លេចលេខសង្ងាត់ ឫ គណនី?',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: KhmerFonts.battambang,
                              package: 'khmer_fonts'),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  thickness: 5,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "មិនទាន់មានគណនី? ",
                    style: TextStyle(
                        fontFamily: KhmerFonts.battambang,
                        package: 'khmer_fonts',
                        color: Colors.blueGrey,
                        fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Text(
                        'បង្កើតគណនី',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: KhmerFonts.dangrek,
                            package: 'khmer_fonts',
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void login() {
    if(_formKey.currentState!.validate()){
      var phoneNumber = _usernameController.text;
      var password = _passwordController.text;
      final LocalStorage storage = new LocalStorage('mobile_token_app');

      LoginReq req = LoginReq();
      req.phoneNumber = phone;
      req.password = pass;
      setState(() {
        this.isLoading=true;
      });
      ApiManager().login(req).then((value){
        //success
        setState(() {
          this.isLoading=false;
          storage.setItem("data", value.toJson());
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
        });



      }).catchError((onError){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('គណនី ឫ លេខសង្ងាត់មិនត្រឹមត្រូវ',style: TextStyle(fontFamily: KhmerFonts.koulen,package: 'khmer_fonts'),),
            content: const Text('សូមវាយបញ្ចូលម្ដងទៀត......',style: TextStyle(fontFamily: KhmerFonts.bayon,package: 'khmer_fonts'),),
            actions: <Widget>[

              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        //error
        setState(() {
          this.isLoading=false;
        });
        print("Login Error");

      });
    }
  }
}
