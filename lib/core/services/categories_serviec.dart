import 'package:story_app/helper/api.dart';
import 'package:story_app/models/product_mode.dart';

class CategoriesServiec {
  Future<List<dynamic>> getCategoriesProducts({
    required String categoryname,
  }) async {
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products/category/$categoryname',
    );
    List<ProductMode> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductMode.fromJson(data[i]));
    }
    return productList;
  }
}
