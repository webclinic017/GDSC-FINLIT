import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bedroom_modal/bdaymodal.dart';
import 'package:FinLit/game_pages/bedroom_modal/bedmodal.dart';
import 'package:FinLit/game_pages/bedroom_modal/giftmodal.dart';
import 'package:FinLit/game_pages/livingroom_modal/livingroom.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TVModal extends StatefulWidget {
  @override
  _TVModalState createState() => _TVModalState();
}

class _TVModalState extends State<TVModal> {
  List<String> scene = ["tv1", "tv2"];
  int index = 0;

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
          actions: [
            IconButton(
              tooltip: "Go back to Home",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        GameMenu(bgUrl: "living room v3.png")));
              },
              icon: Icon(Icons.home),
              color: Colors.white,
              highlightColor: Colors.black,
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: index < scene.length
                  ? AssetImage("assets/images/${scene[index]}.png")
                  : AssetImage("assets/images/living room v3.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              index < scene.length
                  ? Container()
                  : Positioned(
                      top: 50,
                      height: 350,
                      width: 700,
                      left: 50,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                children: [
                                  Image.asset(
                                      "assets/images/tv subscription.png"),
                                  ButtonTheme(
                                      minWidth: 300,
                                      height: 40,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LivingRoomModal()));
                                        },
                                        child: Text(
                                          "Choose Another Subscription",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                          ),
                                          maxLines: 1,
                                        ),
                                        color: Colors.transparent,
                                        splashColor: Colors.black,
                                        highlightColor: Colors.black,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        // minWidth: 250.0,
                                        // height: 50.0,
                                      )),
                                  ButtonTheme(
                                      minWidth: 300,
                                      height: 40,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Add to Budget",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                          ),
                                          maxLines: 1,
                                        ),
                                        color: Colors.transparent,
                                        splashColor: Colors.black,
                                        highlightColor: Colors.black,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        // minWidth: 250.0,
                                        // height: 50.0,
                                      )),
                                ],
                              )),
                        ),
                      ),
                    ),
              index >= scene.length
                  ? Container()
                  : Positioned(
                      top: 250,
                      height: 200,
                      width: 150,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          if (index == scene.length) {
                            // index++;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    backgroundColor: Colors.black,
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(40)),
                                    elevation: 16,
                                    child: Container(
                                      height: 400,
                                      width: 700.0,
                                      child: SingleChildScrollView(
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                    "assets/images/tv subscription.png"),
                                                ButtonTheme(
                                                    minWidth: 300,
                                                    height: 40,
                                                    child: RaisedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Choose Another Subscription",
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                          fontFamily:
                                                              "Inter-Regular",
                                                          fontSize: 16.0,
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                      color: Colors.transparent,
                                                      splashColor: Colors.black,
                                                      highlightColor:
                                                          Colors.black,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 10, 5),
                                                      // minWidth: 250.0,
                                                      // height: 50.0,
                                                    )),
                                                ButtonTheme(
                                                    minWidth: 300,
                                                    height: 40,
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                        int count = 0;
                                                        Navigator.popUntil(
                                                            context, (route) {
                                                          return count++ == 2;
                                                        });
                                                      },
                                                      child: Text(
                                                        "Add to Budget",
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                          fontFamily:
                                                              "Inter-Regular",
                                                          fontSize: 16.0,
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                      color: Colors.transparent,
                                                      splashColor: Colors.black,
                                                      highlightColor:
                                                          Colors.black,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 5, 10, 5),
                                                      // minWidth: 250.0,
                                                      // height: 50.0,
                                                    )),
                                              ],
                                            )),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            setState(() {
                              index++;
                            });
                          }
                        },
                        child: Opacity(
                          opacity: 1,
                          child: Container(
                              width: 20,
                              height: 20,
                              padding: EdgeInsets.all(20),
                              // decoration: BoxDecoration(
                              // border: Border.all(
                              // color: Colors.red,
                              // width: 2.4,
                              // ),
                              // color: Color(0xFF0E3311).withOpacity(0.5)
                              // ),
                              child: Icon(Icons.arrow_forward_ios_sharp,
                                  size: 50,
                                  color: index == 0
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                    ),
            ])));
  }
}
