import 'package:app_isb/Utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResourcesColumn {
  Widget resourcesColumn(BuildContext context, int r1, int g1, int b1, int r2,
      g2, b2, String link, String image, String text) {
    double width = MediaQuery.of(context).size.width;
    double bWidth = width * 0.9;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: bWidth,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromRGBO(r1, g1, b1, 1),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: ShareItem().AppBarCus(context),
                          body: WebView(
                            initialUrl: link,
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
                    color: Color.fromRGBO(r2, g2, b2, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(image),
                      )),
                    ),
                  ),
                ),
                ShareItem().SizedBoxCus(10, 5),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
