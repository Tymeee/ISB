import 'package:flutter/material.dart';
import 'ClassPage/class_page.dart';
import 'Resources/resources.dart';
import 'Login/provider.dart';
import 'package:provider/provider.dart';

class CusBottomNavigationBar extends StatefulWidget {
  @override
  _CusBottomNavigationBar createState() => _CusBottomNavigationBar();
}

class _CusBottomNavigationBar extends State<CusBottomNavigationBar> {
  int indexNumber = 0;
  List<Widget> selectedWidget = <Widget>[
    Resources(),
    Text('announcement'),
    ClassPage(),
    Text('Schedule'),
  ];

  void tapIndex(int index) {
    setState(() {
      indexNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Container(
            child: Image.asset('assets/isb_logo.png')
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(width*0.05, 0, 0, 0),
          icon: Icon(Icons.menu, size: 40, color: Colors.yellow.shade700),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      body: Container(
        child: selectedWidget.elementAt(indexNumber),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            logOut(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow.shade700,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Class Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
        ],
        currentIndex: indexNumber,
        onTap: tapIndex,
      ),
    );
  }

  ListTile logOut() => ListTile(
    title: Text("Log Out"),
    onTap: () {
      final provider =
      Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
    },
  );
}
