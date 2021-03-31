import 'package:FinLit/extra/endDrawer.dart';
import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/game_pages/bedroom_modal/calendar.dart';
import 'package:FinLit/game_pages/bedroom_modal/drawerscene.dart';
import 'package:FinLit/game_pages/bedroom_modal/scene.dart';
import 'package:FinLit/game_pages/desk_modal/addincometaxmodal.dart';
import 'package:FinLit/game_pages/ending.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player/video_player.dart';

class GameHome extends StatefulWidget {
  bool loading;
  bool eventDone = false;
  bool eventDrawer = false;
  bool eventDesk = false;
  bool outsideSceneDone = false;
  bool firstTimeKitchen = true;
  bool firstTimeGrocery = true;
  bool firstTimeTV = true;
  bool firstTimeCalendar = true;
  bool firstTimePlates = true;
  bool firstTimeMainBedroom;


  GameHome(
      {this.eventDone = false,
      this.loading = true,
      this.eventDesk = false,
      this.eventDrawer = false,
      this.outsideSceneDone = false,
      this.firstTimeKitchen = true,
      this.firstTimePlates = true,
      this.firstTimeMainBedroom = false});
  @override
  _GameHomeState createState() => _GameHomeState(this.eventDone, this.loading,
      this.eventDesk, this.eventDrawer, this.outsideSceneDone, this.firstTimeKitchen, this.firstTimePlates, this.firstTimeMainBedroom);
}

class _GameHomeState extends State<GameHome> {
  bool _loading = true;
  bool _firstTimeLeft = true;
  bool _right = true;
  bool _desk = false;
  bool _eventDone = false;
  bool _eventDrawerDone = false;
  bool _eventDeskDone = false;
  bool outsideSceneDone = false;
  bool _isEnd = false;
  bool firstTimeKitchen = true;
  bool firstTimePlates = true;
  bool firstTimeMainBedroom;

  // void initState() {
  //   super.initState();
  //   print(outsideSceneDone);
  // }

  _GameHomeState(bool x,
      [bool y = true,
      bool eventDesk = false,
      bool eventDrawer = false,
      bool outsideSceneDone = false,
      bool firstTimeKitchen = true,
      bool firstTimePlates = true,
      bool firstTimeMainBedroom = false]) {
    _eventDone = x;
    _loading = y;
    _eventDrawerDone = eventDrawer;
    _eventDeskDone = eventDesk;
    this.outsideSceneDone = outsideSceneDone;
    this.firstTimeKitchen = firstTimeKitchen;
    this.firstTimePlates = firstTimePlates;
    this.firstTimeMainBedroom = firstTimeMainBedroom;
  }

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
        actions: [
          IconButton(
            tooltip: "Go back to Home",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GameMenu(bgUrl: "room.png")));
            },
            icon: Icon(Icons.home),
            color: Colors.white,
            highlightColor: Colors.black,
          ),
        ],
      ),

      body: _loading ? showWakeUp() : showRoom(),
      // body: showHomeStatic()
    );
  }

  Widget showRoom() {
    if (_desk) {
      return showDesk();
    }
    if (_right) {
      if (_eventDone) {
        return firstTimeMainBedroom == true ? showRoomDoneScene() : showRoomDone();
      } else {
        return showRoomRight();
      }
    } else {
      if (_firstTimeLeft && !_eventDone) {
        return scan();
      } else {
        return showRoomLeft();
      }
    }
  }

  Widget showRoomDoneScene() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: firstTimeMainBedroom == true ? AssetImage("assets/images/main_bedroom.png") : AssetImage("assets/images/room.png"),
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
                       firstTimeMainBedroom = false;
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
          
        ]));
  }

  Widget showRoomDone() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: firstTimeMainBedroom == true ? AssetImage("assets/images/main_bedroom.png") : AssetImage("assets/images/room.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _right = false;
                    });
                  },
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Icon(Icons.arrow_back_ios_sharp,
                          size: 80, color: Colors.white)),
                ),
              ],
            ),
          ),
          (_eventDone == true &&
                  _eventDrawerDone == true &&
                  _eventDeskDone == true)
              ? Positioned(
                  top: 120,
                  height: 250,
                  width: 250,
                  right: 300,
                  child: GestureDetector(
                    onTap: () {
                      print(firstTimeKitchen);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppDrawer(
                              bgUrl: "room.png",
                              firstTimeKitchen: firstTimeKitchen,
                              firstTimePlates: firstTimePlates,
                              outsideSceneDone: outsideSceneDone)));
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
              : Container(),
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _desk = true;
                      _right = false;
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
            bottom: 25,
            height: 150,
            width: 200,
            left: 25,
            child: GestureDetector(
              onTap: () {
                if (_eventDone == true && _eventDrawerDone == false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DrawerScene()));
                  _eventDrawerDone = true;
                }

                if (_eventDone == false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scene()));
                  _eventDone = true;
                }
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
        ]));
  }

  Widget showRoomRight() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: _eventDone
              ? AssetImage("assets/images/room.png")
              : AssetImage("assets/images/roomright.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _right = false;
                    });
                  },
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Icon(Icons.arrow_back_ios_sharp,
                          size: 80, color: Colors.white)),
                ),
              ],
            ),
          ),
          // Positioned(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             _desk = true;
          //             _right = false;
          //           });
          //         },
          //         child: Container(
          //             width: 100,
          //             height: 200,
          //             child: Icon(Icons.arrow_forward_ios_sharp,
          //                 size: 80, color: Colors.white)),
          //       ),
          //     ],
          //   ),
          // )
        ]));
  }

  Widget showRoomLeft() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/roomleft.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _right = true;
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
          (_eventDone == true &&
                  _eventDrawerDone == true &&
                  _eventDeskDone == true)
              ? Positioned(
                  top: 220,
                  height: 150,
                  width: 100,
                  right: 80,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Calendar()));
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
              : Container(),
          Positioned(
            bottom: 50,
            height: 150,
            width: 150,
            left: -50,
            child: GestureDetector(
              onTap: () {
                if (_eventDone == false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scene()));
                  _eventDone = true;
                }
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
        ]));
  }

  Widget scan() {
    Future.delayed(Duration(milliseconds: 3800), () {
      setState(() {
        _firstTimeLeft = false;
      });
    });
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/scanreverse.gif"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [Container()]));
  }

  Widget showWakeUp() {
    Future.delayed(Duration(milliseconds: 4000), () {
      setState(() {
        _loading = false;
      });
    });
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/scantoright.gif"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            top: 10,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/scan room txt.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ]));
  }

  Widget showHomeStatic() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/kitchen v2.jpg"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [Container()]));
  }

  Widget showDesk() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/desk.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _right = true;
                      _desk = false;
                    });
                  },
                  child: Container(
                      width: 100,
                      height: 200,
                      child: Icon(Icons.arrow_back_ios_sharp,
                          size: 80, color: Colors.white)),
                ),
              ],
            ),
          ),
          (_eventDone == true &&
                  _eventDrawerDone == true &&
                  _eventDeskDone == true)
              ? clickablePhone()
              : Container(),
          clickableNtbk()
        ]));
  }

  Widget clickableNtbk() {

    if (_isEnd == true) {
      return Positioned(
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
                                      "assets/images/final_ntbk.png"),
                                  // Positioned(
                                  //   child: Container(
                                  //     width: 100,
                                  //     height: 100,
                                  //     color: Colors.orange,
                                  //   ),
                                  // )
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
          );
    }

    return _eventDeskDone == false
        ? Positioned(
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
                        elevation: 16,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          height: 500,
                          width: 900.0,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset("assets/images/click ntbk.png"),
                                    // Positioned(
                                    //   child: Container(
                                    //     width: 100,
                                    //     height: 100,
                                    //     color: Colors.orange,
                                    //   ),
                                    // )
                                  ],
                                )),
                          ),
                        ),
                      );
                    });
                setState(() {
                  _eventDeskDone = true;
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
        : Positioned(
            top: 200,
            height: 200,
            width: 150,
            left: 380,
            child: GestureDetector(
              onTap: () {
                if (outsideSceneDone == true) {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => EndingScene()));
                  setState(() {
                    _isEnd = true;
                  });

                } else {
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
                                      // Positioned(
                                      //   child: Container(
                                      //     width: 100,
                                      //     height: 100,
                                      //     color: Colors.orange,
                                      //   ),
                                      // )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      });
                }
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
          );
  }

  Widget clickablePhone() {
    return Positioned(
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
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      // minWidth: 250.0,
                                      // height: 50.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)))),
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
    );
  }
}
