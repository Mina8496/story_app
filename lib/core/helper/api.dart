import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  /// Sends a GET request, optionally using bearer-token authentication.
  /// Returns the decoded response body or throws for a non-200 status.
  Future<dynamic> get({required String uri, String? token}) async {
    // Add authentication only when a token is provided.
    final headers = <String, String>{};
    if (token != null) headers['Authorization'] = 'Bearer $token';

    final response = await http
        .get(Uri.parse(uri), headers: headers)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception(
        'GET $uri failed: ${response.statusCode} ${response.body}',
      );
    }

    return jsonDecode(response.body);
  }

  /// Sends a POST request, optionally using bearer-token authentication,
  /// and returns the decoded JSON object or throws for a non-200 status.
  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    // Attach a bearer token only when the caller provides one.
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url = $url  body= $body  token= $token');
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
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
    // Send the update request and decode the successful JSON response.
    print('url = $url  body= $body  token= $token');
    http.Response response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
        'there is a problem with satus Code${response.statusCode}  with body ${jsonDecode(response.body)}',
      );
    }
  }
}
