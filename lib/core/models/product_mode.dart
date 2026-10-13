class ProductMode {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductMode({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  /// Builds a product model from the JSON returned by the API.
  factory ProductMode.fromJson(Map<String, dynamic> jsonData) {
    final ratingData = jsonData['rating'];

    return ProductMode(
      id: jsonData['id'],
      title: jsonData['title'] as String,
      price: _parsePrice(jsonData['price']),
      description: jsonData['description'] as String,
      image: jsonData['image'] as String,
      category: jsonData['category'] as String,
      rating: ratingData == null
          ? null
          : RatingModel.fromJson(ratingData as Map<String, dynamic>),
    );
  }
}

double _parsePrice(Object? value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.parse(value);

  throw FormatException(
    'Product price must be a number or numeric string.',
    value,
  );
}

class RatingModel {
  final double rating;
  final int count;

  RatingModel({required this.rating, required this.count});

  /// Maps the API's `rate` field to the app's `rating` property.
  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rating: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'] as int,
    );
  }
}
