import 'package:story_app/core/helper/api.dart';
import 'package:story_app/core/models/product_mode.dart';

class AllProductService {
  Future<List<ProductMode>> getAllProduct() async {
    // Fetch the raw product JSON, then convert each item to the app model.
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products',
    );

    List<ProductMode> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductMode.fromJson(data[i]));
    }
    return productList;
  }
}
