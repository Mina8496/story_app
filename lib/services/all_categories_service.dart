import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    http.Response resresponse = await http.get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    );
    List<dynamic> data = jsonDecode(resresponse.body);
    return data;
  }
}
