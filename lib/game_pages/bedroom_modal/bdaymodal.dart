import 'package:FinLit/game_pages/bedroom_modal/bedmodal.dart';
import 'package:FinLit/game_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BdayScene extends StatefulWidget {
  @override
  _BdaySceneState createState() => _BdaySceneState();
}

class _BdaySceneState extends State<BdayScene> {
  List<String> nice = [
    "bday1",
    "bday2",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
      // DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Container(),
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
                          // Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BedRoomModal()));
                          
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
              ]))
    );
  }
}
