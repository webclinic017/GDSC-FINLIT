import 'package:FinLit/game_pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FinLit/game_pages/kitchen_modal/addBudget.dart';

class GroceryScene extends StatefulWidget {
  @override
  _GrocerySceneState createState() => _GrocerySceneState();
}

class _GrocerySceneState extends State<GroceryScene> {
  List<String> nice = [
    "list1",
    "list2",
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
            leading: Container()
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
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(40)),
                                  elevation: 16,
                                  child: Container(
                                    height: 400,
                                    width: 360.0,
                                    child: SingleChildScrollView(
                                      child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  "assets/images/grocery_list.png"),
                                              ButtonTheme(
                                                  minWidth: 300,
                                                  height: 40,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddBudgetModal()));
                                                    },
                                                    child: Text(
                                                      "Add to Budget",
                                                      style: TextStyle(
                                                        color: Colors.white70,
                                                        fontFamily:
                                                            "Inter-Regular",
                                                        fontSize: 16.0,
                                                      ),
                                                      maxLines: 1,
                                                    ),
                                                    color: Colors.transparent,
                                                    splashColor: Colors.black,
                                                    highlightColor:
                                                        Colors.black,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 5, 10, 5),
                                                    // minWidth: 250.0,
                                                    // height: 50.0,
                                                  )),
                                            ],
                                          )),
                                    ),
                                  ),
                                );
                              });
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
