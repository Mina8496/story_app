import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  /// Sends a GET request and returns the decoded response body.
  /// Throws an exception when the server responds with a non-200 status.
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

  /// Sends a POST request, optionally including a bearer token, and decodes
  /// the server response as a JSON object.
  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}
