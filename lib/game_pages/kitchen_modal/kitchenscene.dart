import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/kitchen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KitchenScene extends StatefulWidget {

  bool firstTimeKitchen = false;
  bool firstTimePlates;

  KitchenScene({this.firstTimeKitchen = false, this.firstTimePlates});

  @override
  _KitchenSceneState createState() => _KitchenSceneState(firstTimeKitchen: firstTimeKitchen, firstTimePlates: firstTimePlates);
}

class _KitchenSceneState extends State<KitchenScene> {
  
  bool firstTimeKitchen;
  bool firstTimePlates;
  _KitchenSceneState({this.firstTimeKitchen = false, this.firstTimePlates});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
      // DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => 
            AlertDialog(
                  title: Text(
                    "Oops! :(",
                  ),
                  content: Text(
                      "You can't go back at this stage. Please continue the cutKitchenScene."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                )
                );
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            // title: Text("Game"),
          ),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/kitchen2.png"),
                fit: BoxFit.cover,
              )),
              child: Stack(children: [
                Positioned(
                  top: 250,
                  height: 200,
                  width: 150,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                     Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Kitchen(isKitchen: true, 
                            firstTimePlates: firstTimePlates, firstTimeKitchen: false)),
                            (Route<dynamic> route) => false,
                          );
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
                )
              ]))),
    );
  }
}
