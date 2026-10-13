
import 'package:story_app/core/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      uri: 'https://fakestoreapi.com/products',
    );
    return data;
  }
}
