import 'package:app_isb/Login/firstPage.dart';
import 'package:app_isb/Utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUs createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double bWidth = width * 0.9;
    double eWidth = width * 0.05;

    final _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: ShareItem().AppBarCus(context),
      body: WebView(
        initialUrl: 'https://docs.google.com/document/d/1DuItwXmynr5X3gXlotRXYsLJfJNT_zdW9yX450CMUag/edit?usp=sharing',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Container box(String image) => Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: 125,
    decoration: BoxDecoration(
      color: Colors.yellow.shade700,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        )
      ),
    ),
  );
}