import 'package:FinLit/stockmarket_pages/hilo_open_close_chart.dart';
import 'package:flutter/material.dart';

class FullChart extends StatelessWidget {

  final title;
  FullChart({this.title = "Sample"});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        centerTitle: true,
        backgroundColor: Color(0xFF5433FF),
      ),
      body: Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: HiloOpenCloseChart()),
    );
  }
}