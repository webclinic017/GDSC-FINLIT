import 'package:flutter/material.dart';

class Progressbar extends StatelessWidget {
  final i;

  Progressbar(this.i);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 3),
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: i >= 1 ? Color(0xFF66FCB4) : Colors.white,
                        spreadRadius: 3),
                  ],
                ),
                width: 4,
                height: 8,
                padding: EdgeInsets.all(1),
              )),
          for (int j = 2; j < 20; j++)
            Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: i >= j ? Color(0xFF66FCB4) : Colors.white,
                          spreadRadius: 3),
                    ],
                  ),
                  width: 4,
                  height: 8,
                  padding: EdgeInsets.all(1),
                )),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: i >= 20 ? Color(0xFF66FCB4) : Colors.white,
                      spreadRadius: 3),
                ],
              ),
              width: 4,
              height: 8,
              padding: EdgeInsets.all(1),
            ),
          ),
        ],
      ),
    );
  }
}
