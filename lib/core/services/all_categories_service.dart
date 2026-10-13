import 'package:story_app/core/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    // The API returns the category names as a JSON list.
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
