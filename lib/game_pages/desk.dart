import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FinLit/game_pages/desk_modal/addincometaxmodal.dart';

class Desk extends StatefulWidget {


  
  @override
  _DeskState createState() => _DeskState();
}

class _DeskState extends State<Desk> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
          // DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
        ]);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: null,
          // actions: [
          //   IconButton(
          //     tooltip: "Go back to Home",
          //     onPressed: () {
          //       Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(builder: (context) => Home()),
          //         (Route<dynamic> route) => false,
          //       );
          //     },
          //     icon: Icon(Icons.home),
          //     color: Colors.white,
          //     highlightColor: Colors.black,
          //   ),
          // ],
        ),
        endDrawer: AppDrawer(bgUrl: "desk.png"),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/desk.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              Positioned(
                top: 200,
                height: 180,
                width: 150,
                left: 185,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Container(
                              height: 500,
                              width: 360.0,
                              child: SingleChildScrollView(
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/phone.png"),
                                        ButtonTheme(
                                            minWidth: 300,
                                            height: 40,
                                            child: RaisedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddIncomeTaxModal()));
                                                },
                                                child: Text(
                                                  "Add to Budget",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Inter-Regular",
                                                    fontSize: 16.0,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                color: Colors.transparent,
                                                splashColor: Colors.black,
                                                highlightColor: Colors.black,
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
                                                // minWidth: 250.0,
                                                // height: 50.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)))),
                                      ],
                                    )),
                              ),
                            ),
                          );
                        });
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
              ),
              Positioned(
                top: 200,
                height: 200,
                width: 150,
                left: 380,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(40)),
                            elevation: 16,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 500,
                              width: 900.0,
                              child: SingleChildScrollView(
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                            "assets/images/with_notes.png"),
                                        Positioned(
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        });
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
              )
            ])));
  }
}
