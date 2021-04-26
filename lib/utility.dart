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
}
