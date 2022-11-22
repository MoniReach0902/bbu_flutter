import 'package:flutter/material.dart';

class ButtonLoadingCustomWidget extends StatefulWidget {
  ButtonLoadingCustomWidget({Key? key}) : super(key: key);
  @override
  State<ButtonLoadingCustomWidget> createState() => _ButtonLoadingCustomWidgetState();
}

class _ButtonLoadingCustomWidgetState extends State<ButtonLoadingCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey),
        child: Center(
            child: CircularProgressIndicator(color: Colors.white,)),
    );
  }
}
