import 'package:app_isb/Resources/resourcesColumn.dart';
import 'package:app_isb/Utility/utility.dart';
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

    double bWidth = width * 0.9;
    double eWidth = width * 0.05;

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ShareItem().SizedBoxCus(10, 10),
                ResourcesColumn().resourcesColumn(context, 26, 28, 31, 13, 45, 64, 'https://powerschool.isb.ac.th/public/home.html', 'assets/powerschool.PNG', 'POWERSCHOOL'),
                ResourcesColumn().resourcesColumn(context, 77, 95, 117, 255, 255, 255, 'https://isbangkok.learning.powerschool.com', 'assets/haiku.PNG', 'POWERSCHOOL LEARNING'),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: bWidth,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(255, 200, 87, 1),
                    ),
                    child: TextButton (
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Scaffold(
                              appBar: ShareItem().AppBarCus(context),
                              body: WebView(
                                initialUrl: 'https://library.isb.ac.th/home',
                                javascriptMode: JavascriptMode.unrestricted,
                              ),
                            )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage('assets/isb_lib.PNG'),
                                    fit: BoxFit.fill,
                                  )
                              ),
                            ),
                            ShareItem().SizedBoxCus(10, 5),
                            Center(
                              child: Text('LIBRARY RESOURCES', style: TextStyle(color: Colors.white),),
                            )
                          ],
                        )
                    ),
                  ),
                ),
                ResourcesColumn().resourcesColumn(context, 77, 95, 117, 246, 246, 246, 'https://isbangkok.managebac.com/login', 'assets/manage_bac.PNG', 'MANAGEBAC'),
                ResourcesColumn().resourcesColumn(context, 77, 95, 117, 255, 255, 255, 'https://isbangkok.cialfo.co/signin', 'assets/cialfo.jpg', 'CIALFO'),
                ResourcesColumn().resourcesColumn(context, 255, 200, 87, 255, 255, 255, 'https://docs.google.com/document/u/2/d/110BTnd-v2lINUbcpApeLjPj7vlSig21Uu7bW9V7m9Io/pub?_ga=2.9863664.492086406.1605949806-1229390941.1605949806', 'assets/student_handbook.PNG', 'STUDENT HANDBOOK'),
                ResourcesColumn().resourcesColumn(context, 255, 200, 87, 255, 255, 255, 'https://docs.google.com/forms/d/e/1FAIpQLSerun_qoavp0LdL2K0LXO-9Cck2uH4K-_Cd9neJ2-cxqT76KA/viewform', 'assets/stuco.png', 'STUCO'),
                ShareItem().SizedBoxCus(10, 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

}