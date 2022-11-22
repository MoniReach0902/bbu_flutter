import 'package:flutter/material.dart';


class CardIcon{
  String ? text;
  IconData ? icon;

  CardIcon({this.text, this.icon});
}
List<CardIcon> cardicon=[
  CardIcon(text: "Account",icon: Icons.museum_rounded),
  CardIcon(text: "Local Transfer",icon: Icons.screen_share),
  CardIcon(text: "World Transfer",icon: Icons.message),
  CardIcon(text: "Bill Payment",icon: Icons.payment),
  CardIcon(text: "Phone Top Up",icon: Icons.smartphone_sharp),
  CardIcon(text: "Code Bank",icon: Icons.code),
  CardIcon(text: "Saving",icon: Icons.save),
  CardIcon(text: "Loan",icon: Icons.local_activity),
  CardIcon(text: "Cash-Out",icon: Icons.send),

];