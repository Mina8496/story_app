
import 'package:story_app/core/helper/api.dart';
import 'package:story_app/core/models/product_mode.dart';

class AddProduct {
  /// Creates a product through Fake Store API and parses its response.
  Future<ProductMode> addProduct({
    required String title,
    required String price,
    required String doc,
    required String image,
    required String category,
  }) async {
    // Match the field names expected by the Fake Store API.
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': doc,
        'image': image,
        'category': category,
      },
    );
    return ProductMode.fromJson(data);
  }
}
