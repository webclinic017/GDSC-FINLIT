import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForumWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://dscazuki.000webhostapp.com/topic",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
