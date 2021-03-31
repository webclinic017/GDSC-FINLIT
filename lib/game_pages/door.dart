import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bill/bill.dart';
import 'package:FinLit/game_pages/kitchen.dart';
import 'package:FinLit/game_pages/outside_modal/outsidemenu.dart';
import 'package:FinLit/game_pages/outsideone.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Door extends StatefulWidget {
  
  bool firstTimeOutside;
  Door({this.firstTimeOutside = true});
  @override
  _DoorState createState() => _DoorState(firstTimeOutside);
}

class _DoorState extends State<Door> {
  var input = 0;
  bool _firstTimeOutside;

  _DoorState(_firstTimeOutside);



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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameMenu(bgUrl: "door.png")));
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
              image: AssetImage("assets/images/door.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [

              Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Kitchen()),
                                (Route<dynamic> route) => false,
                              );
                  },
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Icon(Icons.arrow_back_ios_sharp,
                          size: 80, color: Colors.white)),
                ),
              ])),


              Positioned(
                top: 20,
                height: 300,
                width: 200,
                left: 300,
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => OutsideMenu()));
                    
                  },
                  //transparent button manipulation
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
              ),


              Positioned(
                top: 160,
                height: 120,
                width: 80,
                left: 370,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bill()),
                    );
                  },
                  child: Opacity(
                    opacity: 0,
                    child: Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
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
              )
            ]
            )));
  }
}