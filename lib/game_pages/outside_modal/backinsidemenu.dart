import 'package:FinLit/game_pages/door.dart';
import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/kitchen.dart';
import 'package:FinLit/game_pages/livingroom.dart';
import 'package:FinLit/game_pages/outside_modal/outsidescene.dart';
import 'package:FinLit/game_pages/outsideone.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackInsideMenu extends StatefulWidget {
  bool outsideSceneDone;
  bool firstTimePlates;

  BackInsideMenu({this.outsideSceneDone, this.firstTimePlates});
  @override
  _BackInsideMenuState createState() =>
      _BackInsideMenuState(outsideSceneDone: this.outsideSceneDone, firstTimePlates: this.firstTimePlates);
}

class _BackInsideMenuState extends State<BackInsideMenu> {
  
  bool outsideSceneDone;
  bool firstTimePlates;
  _BackInsideMenuState({this.outsideSceneDone, this.firstTimePlates});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: null,
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/outside27.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              Positioned(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 500,
                            height: 250,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                      "Are you sure you want to go inside?",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(.0, 2.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                          fontFamily: "Ubuntu",
                                          fontSize: 22,
                                          color: Colors.white)),
                                ),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 10,
                                          offset: Offset(0, -1),
                                        ),
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 10,
                                          offset: Offset(-1, -1),
                                        ),
                                      ],
                                    ),
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Kitchen(isKitchen: false, outsideSceneDone: outsideSceneDone,
                                                  firstTimePlates: firstTimePlates)),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      color: Colors.black54,
                                      splashColor: Colors.black,
                                      highlightColor: Colors.black,
                                      child: Text("Yes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Inter-Medium",
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 300,
                                  height: 30,
                                  child: Container(
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 10,
                                          offset: Offset(0, -1),
                                        ),
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 10,
                                          spreadRadius: 10,
                                          offset: Offset(-1, -1),
                                        ),
                                      ],
                                    ),
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Outsideone()),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      color: Colors.black54,
                                      splashColor: Colors.black,
                                      highlightColor: Colors.black,
                                      child: Text("No",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Inter-Medium",
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              )),
            ])));
  }
}
