import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticle extends StatefulWidget {

  final String initialUrl;
  NewsArticle({this.initialUrl});

  @override
  _NewsArticleState createState() => _NewsArticleState(initialUrl: initialUrl);
}

class _NewsArticleState extends State<NewsArticle> {

  String initialUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();
  bool _loading = true;
  _NewsArticleState({this.initialUrl});

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FinLit App"),
          backgroundColor: Colors.indigoAccent,
        ),
        body: _loading ? Container(
          child: SpinKitCircle(size: 50, color: Color(0xFFD3D3D3)),
        ) : Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: initialUrl,
          onWebViewCreated: ((WebViewController webController) {
            controller.complete(webController);
          }),
        ),
      ),
    );
  }
}