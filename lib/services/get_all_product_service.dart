import 'package:story_app/helper/api.dart';
import 'package:story_app/models/product_mode.dart';

class AllProductService {
  Future<List<ProductMode>> getAllProduct() async {
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products/categories',
    );

    List<ProductMode> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductMode.fromJson(data[i]));
    }
    return productList;
  }
}
