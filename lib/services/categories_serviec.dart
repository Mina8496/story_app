import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:story_app/models/product_mode.dart';

class CategoriesServiec {
  Future<List<dynamic>> getCategoriesProducts({
    required String categoryname,
  }) async {
    http.Response response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/category/$categoryname'),
    );
    List<dynamic> data = jsonDecode(response.body);
    List<ProductMode> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductMode.fromJson(data[i]));
    }
    return productList;
  }
}
