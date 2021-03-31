import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/outsideone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutsideScene extends StatefulWidget {

  bool firstTimePlates;
  OutsideScene({this.firstTimePlates});
  @override
  _OutsideSceneState createState() => _OutsideSceneState(firstTimePlates: this.firstTimePlates);
}

class _OutsideSceneState extends State<OutsideScene> {
  List<String> nice = [
    "outside1",
    "outside2",
    "outside3",
    "outside4",
    "outside5",
    "outside6",
    "outside7",
    "outside8",
    "outside9",
    "outside10",
    "outside11",
    "outside12",
    "outside13",
    "outside14",
    "outside15",
    "outside16",
    "outside17",
    "outside18",
    "outside19",
    "outside20",
    "outside21",
    "outside22",
    "outside23",
    "outside24",
    "outside25",
    "outside26",
  ];
  int index = 0;
  bool firstTimePlates;

  _OutsideSceneState({this.firstTimePlates});

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
            builder: (context) => AlertDialog(
                  title: Text(
                    "Oops! :(",
                  ),
                  content: Text(
                      "You can't go back at this stage. Please continue the cutOutsideScene."),
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
                ));
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
                image: AssetImage("assets/images/${nice[index]}.png"),
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
                      setState(() {
                        if (index >= nice.length - 1) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Outsideone(firstTimePlates: firstTimePlates)),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          // print(nice[index]);
                          index++;
                        }
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
                )
              ]))),
    );
  }
}
