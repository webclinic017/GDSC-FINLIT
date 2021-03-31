import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/game_pages/outside_modal/backinsidemenu.dart';
import 'package:FinLit/game_pages/outside_modal/outsidescene.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Outsideone extends StatefulWidget {

  bool firstTimePlates;
  Outsideone({this.firstTimePlates});
  @override
  _OutsideoneState createState() => _OutsideoneState(firstTimePlates: this.firstTimePlates);
}

class _OutsideoneState extends State<Outsideone> {
 
  bool firstTimePlates;
  _OutsideoneState({this.firstTimePlates});

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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: Icon(Icons.home),
              color: Colors.white,
              highlightColor: Colors.black,
            ),
          ],
        ),
        body: staticOutside()
        
        
        );
  }


  Widget staticOutside() {
    return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/outside27.png"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              Positioned(
                top: 30,
                height: 380,
                width: 240,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    
                    Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BackInsideMenu(outsideSceneDone: true, firstTimePlates: firstTimePlates)),
                          (Route<dynamic> route) => false,
                        );
                    // Navigator.of(context)
                    // outsideSceneDone
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
            ]));
  }

}
