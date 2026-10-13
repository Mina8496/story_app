import 'package:story_app/core/helper/api.dart';
import 'package:story_app/core/models/product_mode.dart';

class UpdateProduct {
  /// Submits the supplied product fields and parses the API response.
  Future<ProductMode> updateProduct({
    required String title,
    required String price,
    required String doc,
    required String image,
    required String category,
  }) async {
    // Send the edited product fields, then parse the API response.
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
