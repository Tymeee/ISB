import 'package:flutter/material.dart';
import 'Login/firstPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      fontFamily: 'HelveticaNeue-Light'
    ),
    debugShowCheckedModeBanner: false,
    title: 'ISB',
    home: FirstPage(),
  );
}
