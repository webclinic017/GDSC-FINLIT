import 'package:flutter/material.dart';

class StockProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 8,
                  color: Colors.indigoAccent,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Stack(overflow: Overflow.visible, children: [
                    Container(
                      child: Positioned(
                          bottom: -90,
                          // right: MediaQuery.of(context).size.width / 2,
                          left: MediaQuery.of(context).size.width / 3.5,

                          // top: 65
                          child: Container(
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/habit4.jpg'),
                              ),
                              width: 150.0,
                              height: 150.0,
                              padding: const EdgeInsets.all(2.0), // borde width
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF), // border color
                                shape: BoxShape.circle,
                              ))),
                    )
                  ])),
              SizedBox(height: 80),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                // width: MediaQuery.of(context).size.width / 2,
                child: Text("Victoria Robertson",
                    style: TextStyle(
                      fontFamily: "Inter-Bold",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
                // width: MediaQuery.of(context).size.width / 2,
                child: Text("Lorem Ipsum Bio | Lorem Ipsu M bI oOo orem Ipsum Bio |",
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: "Inter-Regular",
                      fontSize: 12,
                    )),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.fromLTRB(45, 10, 20, 10),
                width: MediaQuery.of(context).size.width,
                // width: MediaQuery.of(context).size.width / 2,
                child: Text("Your Stats",
                    style: TextStyle(
                      fontFamily: "Inter-Bold",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF4CAF50)
                          ),
                          child: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                        Text("\$39,940.96",
                            style: TextStyle(
                                fontFamily: "Inter-Regular", fontSize: 14, fontWeight: FontWeight.bold,
                                color: Color(0xFF4CAF50))),
                        Text("\NET PROFIT",
                            style: TextStyle(
                                fontFamily: "Inter-Medium", fontSize: 14,
                                fontWeight: FontWeight.w600, color: Colors.grey[400],))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red[400]
                          ),
                          child: Icon(
                            Icons.flight_land_outlined,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                        Text("\$39,940.96",
                            style: TextStyle(
                                fontFamily: "Inter-Regular", fontSize: 14, fontWeight: FontWeight.bold,
                                color: Colors.red[400])),
                        Text("\NET LOSS",
                            style: TextStyle(
                                fontFamily: "Inter-Medium", fontSize: 14,
                                fontWeight: FontWeight.w600, color: Colors.grey[400],))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.indigoAccent
                          ),
                          child: Icon(
                            Icons.tag_faces_rounded,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                        Text("10",
                            style: TextStyle(
                                fontFamily: "Inter-Regular", fontSize: 14, fontWeight: FontWeight.bold,
                                color: Colors.indigoAccent)),
                        Text("POSITIVE TRANSACTIONS",
                        textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter-Medium", fontSize: 14,
                                fontWeight: FontWeight.w600, color: Colors.grey[400],))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 150,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange[400]
                          ),
                          child: Icon(
                            Icons.highlight_off_sharp,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                        Text("4",
                            style: TextStyle(
                                fontFamily: "Inter-Regular", fontSize: 14, fontWeight: FontWeight.bold,
                                color: Colors.orange[400])),
                        Text("NEGATIVE TRANSACTIONS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Inter-Medium", fontSize: 14,
                                fontWeight: FontWeight.w600, color: Colors.grey[400],))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
