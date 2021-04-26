import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPage createState() => _ClassPage();
}

class _ClassPage extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Coming Soon",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
