import 'package:example1/apis/api_manager.dart';
import 'package:example1/model/register/RegisterReq.dart';
import 'package:example1/model/req/login_req.dart';
import 'package:example1/page/home_page.dart';
import 'package:example1/widget/button_custom_widget.dart';
import 'package:example1/widget/button_loading_custom_widget.dart';
import 'package:example1/widget/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _firstname = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _confirmpassword = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _dateofbirth = new TextEditingController();
  TextEditingController _nationalId = new TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InputTextWidget(
                    label: "First Name",
                    controller: _firstname,
                  ),
                  InputTextWidget(
                    label: "Last Name",
                    controller: _lastname,
                  ),
                  InputTextWidget(
                    label: "Username",
                    controller: _username,
                  ),
                  InputTextWidget(
                    label: "Phone",
                    controller: _phone,
                  ),
                  InputTextWidget(
                    label: "Email",
                    controller: _email,
                  ),
                  InputTextWidget(
                    label: "Date Of Birth",
                    controller: _dateofbirth,
                  ),
                  InputTextWidget(
                    label: "National ID",
                    controller: _nationalId,
                  ),
                  InputTextWidget(
                    label: "Password",
                    controller: _password,
                  ),
                  InputTextWidget(
                    label: "Confirm Password",
                    controller: _confirmpassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  this.isLoading == true
                      ? ButtonLoadingCustomWidget()
                      : ButtonCustomWidget(
                          name: "Register",
                          onClick: () {
                            register();
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      var phoneNumber = _username.text;
      var password = _password.text;

      RegisterReq req =RegisterReq();
      req.phoneNumber=phoneNumber;
      req.confirmPassword=_confirmpassword.text;
      req.deviceId="";
      req.dob="";
      req.firstName=_firstname.text;
      req.lastName=_lastname.text;
      req.email=_email.text;
      req.nationalId=_nationalId.text;
      req.password=_password.text;
      req.username=_username.text;

      setState(() {
        this.isLoading = true;
      });
      ApiManager().register(req).then((value) {
        //success
        setState(() {
          this.isLoading = false;
        });

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Register Success',
              style: TextStyle(
                  fontFamily: KhmerFonts.koulen, package: 'khmer_fonts'),
            ),
            content: const Text(
              '',
              style: TextStyle(
                  fontFamily: KhmerFonts.bayon, package: 'khmer_fonts'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }).catchError((onError) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'គណនី ឫ លេខសង្ងាត់មិនត្រឹមត្រូវ',
              style: TextStyle(
                  fontFamily: KhmerFonts.koulen, package: 'khmer_fonts'),
            ),
            content: const Text(
              'សូមវាយបញ្ចូលម្ដងទៀត......',
              style: TextStyle(
                  fontFamily: KhmerFonts.bayon, package: 'khmer_fonts'),
            ),
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
          this.isLoading = false;
        });
        print("Login Error");
      });
    }
  }
}
