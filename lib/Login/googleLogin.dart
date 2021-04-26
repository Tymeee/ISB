import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'provider.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Colors.white,
    ),
    child: FlatButton.icon(
      label: Text(
        'Sign In With Google',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      textColor: Colors.black,
      icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
      onPressed: () {
        final provider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();
      },
    ),
  );
}
