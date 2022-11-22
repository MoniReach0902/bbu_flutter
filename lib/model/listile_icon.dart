import 'package:flutter/material.dart';

class Listile{
  String?  text;
  IconData ? icon;
  Listile({this.text,this.icon});
}

List<Listile> listile=[
  Listile(text: "Home",icon: Icons.home_filled),
  Listile(text: "Change Languages",icon: Icons.language),
  Listile(text: "Change Themes",icon: Icons.nightlight_round),
  Listile(text: "About",icon: Icons.add_business_outlined),
  Listile(text: "Setting",icon: Icons.settings),
];
