import 'package:easy_localization/easy_localization.dart';
import 'package:example1/model/listile_icon.dart';
import 'package:example1/screen/home_screen.dart';
import 'package:example1/screen/login_screen.dart';
import 'package:example1/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected_page = 0;
  List<Widget> _listScreen = [
    HomeScreen(),
  ];
  PageController _pageController = PageController();
  final LocalStorage storage = new LocalStorage('mobile_token_app');

  bool _change = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: false,
        title: Text("lang".tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      _change
                          ? context.setLocale(Locale('en', 'EN'))
                          : context.setLocale(Locale('km', 'KM'));

                      setState(() {
                        _change = !_change;
                      });
                    },
                    icon: Icon(Icons.language)),
                SizedBox(
                  width: 25,
                ),
                Icon(Icons.notifications)
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(color: Colors.blueGrey),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text(""),
              ),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              Column(
                children: List.generate(listile.length, (index) {
                  return Drawers(listile: listile[index]);
                }),
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: PageView(
          children: _listScreen,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selected_page = index;
            });
          },
        ),
      ),
      bottomNavigationBar: _buildBottom,
    );
  }

  get _buildBottom {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR"),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: "Location"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      currentIndex: selected_page,
      backgroundColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == 3) {
          storage.clear();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        }
        setState(() {
          selected_page = index;
          _pageController.animateToPage(selected_page,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        });
      },
    );
  }
}
