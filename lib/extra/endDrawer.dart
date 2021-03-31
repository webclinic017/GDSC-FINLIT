import 'package:FinLit/game_pages/door.dart';
import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/kitchen.dart';
import 'package:FinLit/game_pages/kitchen_modal/kitchenscene.dart';
import 'package:FinLit/game_pages/livingroom.dart';
import 'package:FinLit/game_pages/outside_modal/outsidescene.dart';
import 'package:FinLit/game_pages/outsideone.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDrawer extends StatefulWidget {
  String bgUrl;
  bool outside;
  bool outsideSceneDone;
  bool firstTimeKitchen;
  bool firstTimePlates;

  AppDrawer(
      {this.bgUrl = "room.png",
      this.outside = false,
      this.outsideSceneDone = true,
      this.firstTimeKitchen = false,
      this.firstTimePlates = true});
  @override
  _AppDrawerState createState() => _AppDrawerState(
      bgUrl: bgUrl,
      outside: this.outside,
      outsideSceneDone: this.outsideSceneDone,
      firstTimeKitchen: this.firstTimeKitchen,
      firstTimePlates: this.firstTimePlates);
}

class _AppDrawerState extends State<AppDrawer> {
  String bgUrl;
  bool outside;
  bool outsideSceneDone;
  bool firstTimeKitchen;
  bool firstTimePlates;

  _AppDrawerState(
      {this.bgUrl,
      this.outside = false,
      this.outsideSceneDone,
      this.firstTimeKitchen,
      this.firstTimePlates});

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
              image: AssetImage("assets/images/$bgUrl"),
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
                            // color: Colors.white,
                            width: 500,
                            height: 250,
                            // color: Colors.white24,
                            //                 decoration: BoxDecoration(
                            //                   color: Colors.white,
                            //                   border: Border.all(
                            //                     color: Colors.white,
                            //                     width: 2,
                            //                   ),
                            //                   borderRadius: BorderRadius.all(
                            // Radius.circular(10.0)),
                            //                 ),
                            child: outside == true
                                ? goOutside()
                                : Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                            "Where would you want to go?",
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(.0, 2.0),
                                                    blurRadius: 3.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
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
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(0, -1),
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(-1, -1),
                                              ),
                                            ],
                                          ),
                                          child: RaisedButton(
                                            onPressed: () {
                                              print(outsideSceneDone);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => GameHome(
                                                        eventDone: true,
                                                        loading: false,
                                                        eventDesk: true,
                                                        eventDrawer: true,
                                                        firstTimeKitchen: firstTimeKitchen,
                                                        firstTimePlates: firstTimePlates,
                                                        outsideSceneDone:
                                                            outsideSceneDone)),
                                                (Route<dynamic> route) => false,
                                              );
                                            },
                                            color: Colors.black54,
                                            splashColor: Colors.black,
                                            highlightColor: Colors.black,
                                            child: Text("Bedroom",
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
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(0, -1),
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(-1, -1),
                                              ),
                                            ],
                                          ),
                                          child: RaisedButton(
                                            onPressed: () {
                                              if (firstTimeKitchen == true) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => KitchenScene(
                                                        firstTimePlates: firstTimePlates,
                                                        firstTimeKitchen: false)),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              } else {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Kitchen(
                                                          isKitchen: true,
                                                          firstTimePlates: firstTimePlates,
                                                          outsideSceneDone:
                                                              outsideSceneDone)),
                                                  (Route<dynamic> route) => false,
                                                );

                                              }
                                            },
                                            color: Colors.black54,
                                            splashColor: Colors.black,
                                            highlightColor: Colors.black,
                                            child: Text("Kitchen",
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
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(0, -1),
                                              ),
                                              BoxShadow(
                                                color: Colors.white
                                                    .withOpacity(0.2),
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
                                                        LivingRoom(
                                                          firstTimeKitchen: firstTimeKitchen,
                                                            firstTimePlates: firstTimePlates,
                                                            outsideSceneDone:
                                                                outsideSceneDone)),
                                                (Route<dynamic> route) => false,
                                              );
                                            },
                                            color: Colors.black54,
                                            splashColor: Colors.black,
                                            highlightColor: Colors.black,
                                            child: Text("Living Room",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Inter-Medium",
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      ],
                    ),
                  ],
                ),
              )),
            ])));
  }

  Widget goOutside() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text("Do you want to go outside?",
              style: TextStyle(shadows: [
                Shadow(
                  offset: Offset(.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ], fontFamily: "Ubuntu", fontSize: 22, color: Colors.white)),
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
                if (outsideSceneDone == true) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OutsideScene(firstTimePlates: firstTimePlates)),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Outsideone(firstTimePlates: firstTimePlates)),
                    (Route<dynamic> route) => false,
                  );
                }
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
                  MaterialPageRoute(builder: (context) => Door()),
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
        ),
      ],
    );
  }
}
