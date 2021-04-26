import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.001, 0.001),
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.white10,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                box(
                    width * 0.90,
                    width * 0.05,
                    width * 0.05,
                    'ISB HandBook',
                    'https://docs.google.com/document/u/2/d/110BTnd-v2lINUbcpApeLjPj7vlSig21Uu7bW9V7m9Io/pub?_ga=2.9863664.492086406.1605949806-1229390941.1605949806',
                    'assets/student_handbook.PNG'),
                /*box(
                    width * 0.90,
                    width * 0.05,
                    width * 0.05,
                    'ISB 20-21 Calendar',
                    'https://calendar.google.com/calendar/u/0/embed?src=student.isb.ac.th_ar4gntki16dcson2lo4ur92ngg@group.calendar.google.com&ctz=Asia/Bangkok'),*/
                box(
                    width * 0.90,
                    width * 0.05,
                    width * 0.05,
                    'Powerschool',
                    "https://powerschool.isb.ac.th/public/home.html",
                    'assets/powerschool.PNG'),
                box(
                    width * 0.90,
                    width * 0.05,
                    width * 0.05,
                    'Haiku',
                    "https://isbangkok.learning.powerschool.com",
                    'assets/haiku.PNG'),
                box(width * 0.90, width * 0.05, width * 0.05, 'Cialfo',
                    'https://isbangkok.cialfo.co/signin', 'assets/cialfo.PNG'),
                /*box(width * 0.90, width * 0.05, width * 0.05, 'CAS Website',
                    'cas.isb.ac.th'),*/
                box(width * 0.90, width * 0.05, width * 0.05, 'Library Website',
                    'https://library.isb.ac.th/home', 'assets/isb_lib.PNG'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Block
  Widget box(double width, double eLeft, double eRight, String title, String url,
      String image) =>
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        width: width,
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.yellow.shade700,
          ),
          child: TextButton(
            onPressed: () {
              /*name = title;
              webUrl = url;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _WebView()),
              );*/
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('$image'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      );
}