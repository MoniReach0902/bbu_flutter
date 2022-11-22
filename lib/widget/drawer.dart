import 'package:example1/model/listile_icon.dart';
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
   Drawers({required this.listile});
  final Listile listile;
  @override
  State<Drawers> createState() => _DrawersState();
}
class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        iconColor: Colors.white,
        leading: Icon(widget.listile.icon,),
        title: Text(widget.listile.text!,style: TextStyle(fontSize: 16,color: Colors.white),),
        trailing: Icon(Icons.arrow_forward_ios,size: 16,),
      ),
    );
  }
}
