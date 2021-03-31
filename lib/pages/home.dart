import 'package:FinLit/authentication/auth.dart';
import 'package:FinLit/authentication/signin.dart';
import 'package:FinLit/forum/forum.dart';
import 'package:FinLit/forum/homepage.dart';
import 'package:FinLit/pages/landing.dart';
import 'package:FinLit/pages/quizpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:FinLit/forum/forum.dart';
import 'package:FinLit/pages/game.dart';
import 'package:FinLit/pages/infocorner.dart';
import 'package:FinLit/pages/stockmarket.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  int currentIndex;
  Home({this.currentIndex: 2});
  @override
  _HomeState createState() => _HomeState(currentIndex, Colors.grey[50]);
}

class _HomeState extends State<Home> {
  int currentTab;
  final AuthService _auth = AuthService();
  Color navColor;

  _HomeState(this.currentTab, this.navColor);

  Widget getTab() {
    if (currentTab == 0)
      return Getjson();
    // return Getjson();
    else if (currentTab == 1)
      return StockMarket();
    else if (currentTab == 2)
      // return Text("THIS IS HOME PAGE HEHEHEHE");
      return HomeLanding();
    else if (currentTab == 3)
      return InfoCorner();
    else if (currentTab == 4)
      // return Forum();
      return MyHomePage();
    else
      // return Text("THIS IS HOME PAGE HEHEHEHE");
      return HomeLanding();
  }
  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("FinLit App"),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              onPressed: () async {
                // print("XD");
                await _auth.signOutUser();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                    (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.logout),
              color: Colors.white,
              highlightColor: Colors.black,
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.indigoAccent,
          backgroundColor: navColor,
          buttonBackgroundColor: Colors.indigoAccent,
          height: 50,
          index: currentTab,
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.linear,
          items: [
            Icon(Icons.gamepad_sharp, size: 20, color: Colors.white),
            Icon(Icons.insert_chart, size: 20, color: Colors.white),
            Icon(Icons.home, size: 20, color: Colors.white),
            Icon(Icons.new_releases, size: 20, color: Colors.white),
            Icon(Icons.forum, size: 20, color: Colors.white),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Getjson()));
            }

            if (index == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => StockMarket()));
            }

            // print("Current Index: $index");
            setState(() {
              currentTab = index;
            });
          },
        ),
        body: getTab());
    // body: Getjson());
  }
}
