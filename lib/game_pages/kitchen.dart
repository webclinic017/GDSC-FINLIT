import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bedroom_modal/scene.dart';
import 'package:FinLit/game_pages/bill/bill.dart';
import 'package:FinLit/game_pages/door.dart';
import 'package:FinLit/game_pages/kitchen_modal/platesmodal.dart';
import 'package:FinLit/game_pages/outside_modal/outsidemenu.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FinLit/game_pages/kitchen_modal/addBudget.dart';
import 'package:FinLit/game_pages/kitchen_modal/groceryscene.dart';

class Kitchen extends StatefulWidget {
  bool isKitchen = true;
  bool outsideSceneDone = false;
  bool firstTimeKitchen = false;
  bool firstTimePlates;
  bool firstTimeGrocery;

  Kitchen(
      {this.isKitchen = true,
      this.outsideSceneDone = false,
      this.firstTimeKitchen = false,
      this.firstTimePlates});

  @override
  _KitchenState createState() => _KitchenState(
      isKitchen: this.isKitchen,
      outsideSceneDone: outsideSceneDone,
      firstTimeKitchen: this.firstTimeKitchen,
      firstTimePlates: this.firstTimePlates);
}

class _KitchenState extends State<Kitchen> {
  bool isKitchen = true;
  bool outsideSceneDone = false;
  bool firstTimeKitchen = false;
  bool firstTimePlates;
  _KitchenState(
      {this.isKitchen,
      this.outsideSceneDone = false,
      this.firstTimeKitchen = false,
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
          actions: [
            IconButton(
              tooltip: "Go back to Home",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GameMenu(bgUrl: "kitchen v2.jpg")));
              },
              icon: Icon(Icons.home),
              color: Colors.white,
              highlightColor: Colors.black,
            ),
          ],
        ),
        body: isKitchen == true ? showKitchen() : showDoor());
  }

  Widget showKitchen() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/kitchen v2.jpg"),
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
                      MaterialPageRoute(
                          builder: (context) => AppDrawer(
                              bgUrl: "kitchen v2.jpg",
                              firstTimePlates: firstTimePlates,
                              outsideSceneDone: outsideSceneDone,
                              firstTimeKitchen: false)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Icon(Icons.arrow_back_ios_sharp,
                          size: 80, color: Colors.white)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKitchen = false;
                    });
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
          Positioned(
            top: 130,
            height: 80,
            width: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryScene()));
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
              top: 180,
              right: 280,
              child: GestureDetector(
                onTap: () {
                  if (firstTimePlates == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlatesModal()));
                    firstTimePlates = false;
                  }
                },
                child: Opacity(
                  opacity: 0,
                  child: Container(
                      width: 100,
                      height: 100,
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
              ))
        ]));
  }

  Widget showDoor() {
    return Container(
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
                        setState(() {
                          isKitchen = true;
                        });
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OutsideMenu(outsideSceneDone: outsideSceneDone)));
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
        ]));
  }
}
