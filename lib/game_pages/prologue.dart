import 'package:FinLit/game_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Prologue extends StatefulWidget {
  @override
  _PrologueState createState() => _PrologueState();
}

class _PrologueState extends State<Prologue> {


  List img = [
    "prologue1.gif",
    "prologue1.png",
    "prologue2.gif",
    "prologue2.png",
    "prologue3.gif",
    "prologue3.png",
    "prologue4.png",
    "prologue5.gif",
    "prologue5.png",
    "prologue6 v2.png",
    "prologue7.gif",
    "prologue7.png",
    "prologue8 v2.gif",
    "prologue8 v2.png",
    "prologue9.gif",
    "prologue9.png",
    "prologue10.gif",
    "prologue11.gif",
    "prologue11.png",
    "prologue12 v4.gif",
    "blinking.gif"
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: null,
        
      ),
      body: index == 0 ? scene1GIF() : index == 1 ? scene1PNG() : index == 2 ? scene2GIF() : index == 3 ? scene2PNG() : index == 4 ? scene3GIF() : index == 5 ? scene3PNG() : index == 6 ? scene4PNG() : index == 7 ? scene5GIF() : index == 8 ? scene5PNG() : index == 9 ? scene6PNG() : index == 10 ? scene7GIF() : index == 11 ? scene7PNG() : index == 12 ? scene8GIF() : index == 13 ? scene8PNG() : index == 14 ? scene9GIF() : index == 15 ? scene9PNG() : index == 16 ? scene10GIF() : index == 17 ? scene11GIF() : index == 18 ? scene11PNG() : index == 19 ? scene12GIF() : scene13GIF()

      
    
    );
  }

  Widget scene1GIF() {
    Future.delayed(Duration(milliseconds: 26000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/prologue1.gif"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene1PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/prologue1.png"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene2GIF() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/prologue2.gif"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene2PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene3GIF() {
    Future.delayed(Duration(milliseconds: 7000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene3PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene4PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene5GIF() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene5PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene6PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene7GIF() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene7PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene8GIF() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
        ]));
  }

  Widget scene8PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene9GIF() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene9PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene10GIF() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene11GIF() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   top: 10,
          //   child: Container(
          //     height: 120.0,
          //     width: 120.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/scan room txt.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // )
        ]));
  }

  Widget scene11PNG() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
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
                        index++;
                      });
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              size: 50, color: Colors.white)),
                    ),
                  ),
                )
        ]));
  }

  Widget scene12GIF() {
    Future.delayed(Duration(milliseconds: 50000), () {
      setState(() {
        index++;
      });
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
        ]));
  }

  Widget scene13GIF() {
    Future.delayed(Duration(milliseconds: 4000), () {
      Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GameHome()),
                  (Route<dynamic> route) => false,
                );
    });

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/${img[index]}"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
        ]));
  }
}