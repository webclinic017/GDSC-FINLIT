import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bill/billmodal.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  String imagePath = "assets/images/vecobill.jpg";
  bool hasNext = true;

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
                top: 70,
                height: 350,
                width: 600,
                left: 50,
                child: Container(
                  child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Image.asset(imagePath),
                            ButtonTheme(
                                minWidth: 300,
                                height: 40,
                                child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BillModal()));
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
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    // minWidth: 250.0,
                                    // height: 50.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)))),
                          ],
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                height: 150,
                width: 100,
                right: 60,
                child: GestureDetector(
                  onTap: () {
                    if (hasNext) {
                      imagePath = "assets/images/mcbill.jpg";
                    } else {
                      imagePath = "assets/images/vecobill.jpg";
                    }
                    hasNext = !hasNext;
                    setState(() {});
                  },
                  child: Container(
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: Colors.red,
                          //     width: 2.4,
                          //   ),
                          // color: Color(0xFF0E3311).withOpacity(0.5)
                          // ),
                          child: Icon(
                              hasNext == true
                                  ? Icons.arrow_forward_ios_sharp
                                  : Icons.arrow_back_ios_sharp,
                              size: 80,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
