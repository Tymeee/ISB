import 'dart:convert';
import 'package:app_isb/Announcement/announcement_model.dart';
import 'package:app_isb/Utility/pdf_api.dart';
import 'package:app_isb/Utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    getData() async {
      var googleAPI;
      var url = Uri.parse(
          'https://communicationapp.isb.ac.th/uploadget.php?desc=desc');
      final post = await http.get(url);
      var data = json.decode(post.body);
      List<AnnouncementModel> announcements = [];
      for (var a in data) {
        AnnouncementModel announcement = AnnouncementModel(
          a["file_name"],
          a["date"],
          a["daynumber"],
          a["day"],
        );
        announcements.add(announcement);
      }
      return announcements;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double bWidth = width * 0.9;
    double eWidth = width * 0.05;

    String localPath;

    String yMMMMD = DateFormat.yMMMMd('en_US').format(DateTime.now());
    String yMD = DateFormat.yMd('en_US').format(DateTime.now());
    String abbrDay = DateFormat.E('en_US').format(DateTime.now());

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(eWidth, 0, eWidth, 0),
          child: Container(
            height: height,
            child: Column(
              children: <Widget>[
                ShareItem().SizedBoxCus(10, 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's Date",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ShareItem().SizedBoxCus(10, 10),
                Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(225, 226, 227, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        abbrDay + " " + yMMMMD,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 27),
                      ),
                    )),
                ShareItem().SizedBoxCus(10, 20),
                /* Align(
                alignment: Alignment.centerLeft,
                child: Text("AQI Monitor", style: TextStyle(fontSize: 17),),
              ),
              ShareItem().SizedBoxCus(10, 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(225, 226, 227, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ShareItem().SizedBoxCus(10, 20),*/
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "HS Daily Announcement",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ShareItem().SizedBoxCus(10, 10),
                Expanded(
                  child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextButton(
                                    onPressed: () async {
                                      final url =
                                          'https://communicationapp.isb.ac.th/uploads/' +
                                              snapshot.data[i].file_name;
                                      await PDFApi()
                                          .loadNetwork(
                                              url, snapshot.data[i].file_name)
                                          .then((value) {
                                        setState(() {
                                          localPath = value;
                                        });
                                      });
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Scaffold(
                                                  appBar: ShareItem()
                                                      .AppBarCus(context),
                                                  body: localPath != null
                                                      ? PDFView(
                                                          filePath: localPath,
                                                          fitPolicy:
                                                              FitPolicy.WIDTH,
                                                          pageSnap: true,
                                                        )
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                )),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 200, 87, 1),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  snapshot.data[i].day,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  snapshot.data[i].date,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "HS Daily Bulletin",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
