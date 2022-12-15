import 'package:example1/page/home_page.dart';
import 'package:example1/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenApp extends StatefulWidget {
  const SplashScreenApp({Key? key}) : super(key: key);

  @override
  State<SplashScreenApp> createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new LoginScreen(),
        image:  Image.network('https://bbu.edu.kh/assets/images/logo.png'),
        backgroundColor: Colors.blueGrey,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 190.0,
        loaderColor: Colors.white
    );
  }
}
