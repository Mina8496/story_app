import 'package:story_app/core/helper/api.dart';
import 'package:story_app/core/models/product_mode.dart';

class UpdateProductService {
  /// Submits the supplied product fields and parses the API response.
  Future<ProductMode> updateProduct({
    required String title,
    required String price,
    required String doc,
    required String image,
    required String category,
    required int id,
  }) async {
    // Send the edited product fields, then parse the API response.
    print('product id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': num.parse(price),
        'description': doc,
        'image': image,
        'category': category,
      },
    );
    return ProductMode.fromJson(data);
  }
}
