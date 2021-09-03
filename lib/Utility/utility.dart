import 'package:app_isb/Login/firstPage.dart';
import 'package:flutter/material.dart';

class ShareItem {
  Color themeYellow = Colors.yellow.shade800;
  Container schoolLogo(double size) => Container(
    child: Icon(
      Icons.school,
      size: size,
    ),
  );

  SizedBox SizedBoxCus(double width, double height) => SizedBox(
    width: width,
    height: height,
  );

  Widget AppBarCus(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: Color.fromRGBO(255, 200, 87, 1),
      toolbarHeight: 60,
      centerTitle: true,
      flexibleSpace: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(width*0.75, 45, 0, 0),
          child: Container(
              height: 55,
              child: Image.asset('assets/isb_logo.png',)
          ),
        ),
      ),
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(width*0.05, 0, 0, 0),
          icon: Image.asset('assets/back_arrow.png', height: 40,),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
          },
        ),
      );
  }

}
