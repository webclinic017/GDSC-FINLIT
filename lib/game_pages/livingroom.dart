import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/door.dart';
import 'package:FinLit/game_pages/livingroom_modal/livingroom.dart';
import 'package:FinLit/game_pages/livingroom_modal/tvmodal.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LivingRoom extends StatefulWidget {
  
  bool firstTimeKitchen;
  bool outsideSceneDone;
  bool firstTimePlates;

  LivingRoom({this.outsideSceneDone, this.firstTimeKitchen, this.firstTimePlates});
  @override
  _LivingRoomState createState() => _LivingRoomState(outsideSceneDone: this.outsideSceneDone, firstTimeKitchen: this.firstTimeKitchen, firstTimePlates: this.firstTimePlates);
}

class _LivingRoomState extends State<LivingRoom> {

  bool outsideSceneDone;
  bool firstTimeKitchen;
  bool firstTimePlates;

  _LivingRoomState({this.outsideSceneDone, this.firstTimeKitchen, this.firstTimePlates});
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameMenu(bgUrl: "living room v3.png")));
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
              image: AssetImage("assets/images/living room v3.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              Positioned(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AppDrawer(bgUrl: "living room v3.png", outsideSceneDone: outsideSceneDone, firstTimeKitchen: firstTimeKitchen, firstTimePlates: firstTimePlates)),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Container(
                          width: 100,
                          height: 200,
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 80, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              getTV(),
            ])));
  }


  Widget getTV() {
    return Positioned(
                top: 0,
                height: 150,
                width: 180,
                right: 320,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TVModal()));
                  },
                  child: Opacity(
                    opacity: 0,
                    child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2.4,
                          ),
                          // color: Color(0xFF0E3311).withOpacity(0.5)
                        ),
                        child: null
                        // Icon(Icons.arrow_forward_ios_sharp,
                        //     size: 80, color: Colors.white)
                        ),
                  ),
                ),
              );
  }
}
