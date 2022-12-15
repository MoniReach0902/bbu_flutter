import 'package:easy_localization/easy_localization.dart';
import 'package:example1/apis/api_manager.dart';
import 'package:example1/model/card_icon.dart';
import 'package:example1/model/category/MenuList.dart';
import 'package:example1/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:khmer_fonts/khmer_fonts.dart';
import 'package:localstorage/localstorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading =false;
  List<MenuList> categories=[];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
    // print(getCategory());

  }
  getCategory(){
    setState(() {
      this.isLoading=true;
    });
    ApiManager().getAllCategory().then((value) {
      setState(() {
        this.isLoading=false;
        categories=value.data!.menuList!;
      });
    });
  }

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
            _grid("en_EN"),
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
  _grid(String lang) {
    print(lang);
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
                children: List.generate(categories.length, (index) {
                  var category=categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   cate
                          //   color: Colors.white,
                          //   size: 30,
                          // ),
                          SizedBox(height: 10,),
                          Text(
                            lang=="en_EN"? category.name!:category.nameKh!,
                            style: TextStyle(fontSize: 15, color: Colors.white,fontFamily:KhmerFonts.content,
                              package: 'khmer_fonts',),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ))
        ],
      ),
    );
  }
 //end grid
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
  } }
