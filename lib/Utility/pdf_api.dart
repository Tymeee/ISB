import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PDFApi {
  loadNetwork(String url, String name) async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/$name");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}