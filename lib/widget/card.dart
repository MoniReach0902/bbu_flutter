import 'package:example1/model/card_icon.dart';
import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  MyCards({required this.cardIcon});
  final CardIcon cardIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              cardIcon.icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(height: 10,),
            Text(
              cardIcon.text!,
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
