import 'package:flutter/material.dart';
import 'googleLogin.dart';
import 'provider.dart';
import '../Resources//resources.dart';
import '../utility.dart';

import 'googleLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String id, password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow.shade800,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              logo('assets/isb_logo.png', height * 0.18),
              textBox('International School Bangkok', 16, Colors.black),
              ShareItem().SizedBoxCus(8, 30),
              textBox('Welcome to the ISB APP', 25, Colors.white),
              ShareItem().SizedBoxCus(8, height * 0.2),
              GoogleSignupButtonWidget(),
              ShareItem().SizedBoxCus(8, 15),
              textBox('Login with your school email address', 16, Colors.white),
              ShareItem().SizedBoxCus(8, height * 0.2),
              logo('assets/tech_logo.PNG', 65),
              textBox('Created by HS Technology Council', 10, Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  //School Logo
  Widget logo(String image, double height) => Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('$image'),
        fit: BoxFit.fitWidth,
      ),
    ),
  );

  Container textBox(String text, double textSize, Color textColor) => Container(
    child: Text(
      '$text',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: textSize,
        color: textColor,
      ),
    ),
  );
}
