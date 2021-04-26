import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class _ISB_HandbookState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ISB Handbook"),
      ),
      body: WebView(
        initialUrl: 'https://docs.google.com/document/u/2/d/110BTnd-v2lINUbcpApeLjPj7vlSig21Uu7bW9V7m9Io/pub?_ga=2.9863664.492086406.1605949806-1229390941.1605949806',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}