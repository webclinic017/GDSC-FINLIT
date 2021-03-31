import 'package:FinLit/game_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EndingScene extends StatefulWidget {
  @override
  _EndingSceneState createState() => _EndingSceneState();
}

class _EndingSceneState extends State<EndingScene> {

  List<String> nice = ["client notif 1", "client notif 2", "client notif 3", "client notif 4", "client notif 5", "client notif 6"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
   SystemChrome.setPreferredOrientations(
        [
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
                      "You can't go back at this stage. Please continue the cutscene."),
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
                          Navigator.pop(
                                  context
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
                          child:
                          Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)
                          ),
                    ),
                  ),
                )
              ]))),
    );
  }
}