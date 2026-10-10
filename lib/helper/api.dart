import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri}) async {
    http.Response resresponse = await http.get(Uri.parse(uri));
    
    if (resresponse.statusCode == 200) {
      return jsonDecode(resresponse.body);
    } else {
      throw Exception(
        'there is a problem with satus Code${resresponse.statusCode}  ',
      );
    }
  }
}
