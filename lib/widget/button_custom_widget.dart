import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatefulWidget {
  VoidCallback? onClick;
  String? name;
  ButtonCustomWidget({Key? key, this.name, this.onClick}) : super(key: key);

  @override
  State<ButtonCustomWidget> createState() => _ButtonCustomWidgetState();
}

class _ButtonCustomWidgetState extends State<ButtonCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey),
        child: Center(
            child: Text(
              "${widget.name}",
              style: TextStyle(color: Colors.white),
            ),),
      ),
    );
  }
}
