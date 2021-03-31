import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bedroom_modal/bdaymodal.dart';
import 'package:FinLit/game_pages/bedroom_modal/bedmodal.dart';
import 'package:FinLit/game_pages/bedroom_modal/giftmodal.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  List<String> scene = [
    // "calendar",
    "calendar1",
    "calendar2"
  ];
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameMenu(bgUrl: "room.png")));
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
              image: index < scene.length ? AssetImage("assets/images/${scene[index]}.png") :
              AssetImage("assets/images/roomleft.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              index < scene.length ? Container() : Positioned(
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
                            Image.asset("assets/images/calendar.png"),
                          ],
                        )),
                  ),
                ),
              ),
              
              
              index < scene.length ? Container() : Positioned(
                top: 180,
                height: 150,
                width: 100,
                left: 260,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BdayScene()
                        )
                        );
                  },
                  child: Container(
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
                          //     size: 80, color: Colors.red)
                          ),
                    ),
                  ),
                ),
              ),
              index < scene.length ? Container() : Positioned(
                top: 275,
                height: 120,
                width: 100,
                left: 420,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GiftScene()
                        )
                    );
                  },
                  child: Container(
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
                          //     size: 80, color: Colors.red)
                          ),
                    ),
                  ),
                ),
              ),
              
              
              index >= scene.length ? Container() : Positioned(
                  top: 250,
                  height: 200,
                  width: 150,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       index++;
                     });
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
                              size: 50, color: Colors.white)),
                    ),
                  ),
                ),
            ])));
  }
}
