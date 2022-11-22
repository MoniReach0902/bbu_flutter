import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  TextEditingController? controller;
  String? label;
  Icon? icon;
  bool? password;

  InputTextWidget(
      {Key? key, this.controller, this.label, this.icon, this.password})
      : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: widget.password ?? false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please input ${widget.label}";
          }
        },
        controller: widget.controller,
        decoration: InputDecoration(
            label: Text(widget.label ?? ""),
            prefixIcon: widget.icon,
            hintText: widget.label ?? "",
            border: const OutlineInputBorder()),
      ),
    );
  }
}
