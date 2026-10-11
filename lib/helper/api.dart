import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  /// Sends a GET request, optionally using bearer-token authentication.
  /// Returns the decoded response body or throws for a non-200 status.
  Future<dynamic> get({required String uri, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response resresponse = await http.get(Uri.parse(uri), headers: headers);

    if (resresponse.statusCode == 200) {
      return jsonDecode(resresponse.body);
    } else {
      throw Exception(
        'there is a problem with satus Code${resresponse.statusCode}  ',
      );
    }
  }

  /// Sends a POST request, optionally using bearer-token authentication,
  /// and returns the decoded JSON object or throws for a non-200 status.
  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
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
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
        'there is a problem with satus Code${response.statusCode}  with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    // Include JSON content type and optional bearer-token authentication.
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/json; charset=utf-8'});

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    // Send the request body and decode the successful JSON response.
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
        'there is a problem with satus Code${response.statusCode}  with body ${jsonDecode(response.body)}',
      );
    }
  }
}
