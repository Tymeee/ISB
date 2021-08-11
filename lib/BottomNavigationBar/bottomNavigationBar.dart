import 'package:app_isb/Announcement/announcement.dart';
import 'package:app_isb/Tab/about_us.dart';
import 'package:app_isb/Utility/google_API.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../ClassPage/class_page.dart';
import '../Resources/resources.dart';
import '../Login/provider.dart';
import 'package:provider/provider.dart';
import '../Schedule/Schedule.dart';
import '../Utility/pdf_api.dart';
import '../Utility/utility.dart';

class CusBottomNavigationBar extends StatefulWidget {
  @override
  _CusBottomNavigationBar createState() => _CusBottomNavigationBar();
}

class _CusBottomNavigationBar extends State<CusBottomNavigationBar> {
  int indexNumber = 0;
  List<Widget> selectedWidget = <Widget>[
    Announcement(),
    Schedule(),
    Resources(),
    ClassPage(),
  ];

  List<String> titleName = ["ANNOUNCEMENT", "SCHEDULE", "RESOURCES", "CLASS PAGE"];

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

    String localPath;

    return Container(
      color: Color.fromRGBO(255, 200, 87, 1),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 200, 87, 1),
            toolbarHeight: 50,
            centerTitle: true,
            title: Text(titleName[indexNumber], style: TextStyle(color: Colors.white, fontSize: 22.5),),
            flexibleSpace: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(width*0.75, 0, 0, 0),
                child: Container(
                    height: 55,
                    child: Image.asset('assets/isb_logo.png',)
                ),
              ),
            ),
            leading: IconButton(
              padding: EdgeInsets.fromLTRB(width*0.05, 0, 0, 0),
              icon: Image.asset('assets/sidebar_icon.png', height: 50,),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
          body: Container(
            child: selectedWidget.elementAt(indexNumber),
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  sizedBox(),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Color.fromRGBO(255, 200, 87, 1),
                    child: Center(
                      child: CircleAvatar(
                        radius: 95,
                        backgroundImage: NetworkImage(googleAPI.user.photoURL),
                      ),
                    ),
                  ),
                  sizedBox(),
                  Container(
                    child: Center(
                      child: Text("${googleAPI.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    ),
                  ),
                  sizedBox(),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(width*0.05, 0, width*0.42, 0),
                    trailing: Icon(Icons.person_outline_sharp, color: Colors.black,),
                    title: Text("About Us", style: TextStyle(fontSize: 17, color: Colors.black)),
                    onTap: () async {
                      final url = '';
                      await PDFApi().loadNetwork(url, 'About Us').then((value) {
                        setState(() {
                          localPath = value;
                        });
                      });
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scaffold(
                          appBar: ShareItem().AppBarCus(context),
                          body: localPath != null ? PDFView(
                            filePath: localPath,
                            fitPolicy: FitPolicy.HEIGHT,
                          )
                              : Center(
                            child: CircularProgressIndicator(),
                          ),
                        )),
                      );
                    },
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.fromLTRB(width*0.05, 0, width*0.42, 0),
                      trailing: Icon(Icons.logout, color: Colors.black,),
                      title: Text("Log Out", style: TextStyle(fontSize: 17, color: Colors.black)),
                      onTap: () {
                        final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.logout();
                      }
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.yellow.shade700,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('assets/announcement.png', height: 30,),
                label: 'Announcement',
                activeIcon: Image.asset('assets/announcement_yellow.png', height: 30),
                //backgroundColor: Color.fromRGBO(255, 200, 87, 1),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/schedule.png', height: 30,),
                label: 'Schedule',
                activeIcon: Image.asset('assets/schedule_yellow.png', height: 30),
                //backgroundColor: Color.fromRGBO(255, 200, 87, 1),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/resources.png', height: 30,),
                label: 'Resources',
                activeIcon: Image.asset('assets/resources_yellow.png', height: 30),
                //backgroundColor: Color.fromRGBO(255, 200, 87, 1),
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/class.png', height: 30,),
                label: 'Class Page',
                activeIcon: Image.asset('assets/class_yellow.png', height: 30),
                //backgroundColor: Color.fromRGBO(57,58,86, 1),
              ),
            ],
            currentIndex: indexNumber,
            onTap: tapIndex,
          ),
        ),
      ),
    );
  }

  Container sizedBox(){
    return Container(
      height: 20,
    );
  }
}
