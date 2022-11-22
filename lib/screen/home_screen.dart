import 'package:example1/model/card_icon.dart';
import 'package:example1/widget/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            _row("Account Name", "00000000"),
            const SizedBox(
              height: 25,
            ),
            _row("Total Balance", "999,999.00 USD"),
            const SizedBox(
              height: 30,
            ),
            _grid(),
            const SizedBox(height: 30),
            _row_slide(180, "XXXX"),
            const SizedBox(
              height: 20,
            ),
            _row("Slides", "More"),
            _row_slide(250, "ABC"),
            const SizedBox(
              height: 20,
            ),
            _row("Production", "More"),
            const SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }

  _row_slide(double height,String text){
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 350,
                height: height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.shade700),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: 350,
                height: height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.shade700),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: 350,
                height: height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.shade700),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  //Grind
  _grid() {
    return Container(
      width: double.infinity,
      height: 412,
      child: Stack(
        children: [
          Container(
            height: 412,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(cardicon.length, (index) {
                  return MyCards(cardIcon: cardicon[index]);
                }),
              ))
        ],
      ),
    );
  } //end grid

  _row(String text, String num) {
    //Row
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            num,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  } //  End Row
}
