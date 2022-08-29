import 'dart:convert';

import 'package:http/http.dart';

class Network{
  Network(this.url);
  final String url;

  Future getData() async{
    Response response= await get(Uri.parse(url));
    if(response.statusCode==200) {
      var data = response.body;
      return jsonDecode(data);
    }
    else{
      return response.statusCode;
    }
  }
}