class ProductMode {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductMode({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  factory ProductMode.fromJson(Map<String, dynamic> jsonData) {
    return ProductMode(
      id: jsonData['id'] as int,
      title: jsonData['title'] as String,
      price: (jsonData['price'] as num).toDouble(),
      description: jsonData['description'] as String,
      image: jsonData['image'] as String,
      category: jsonData['category'] as String,
      rating: RatingModel.fromJson(jsonData['rating'] as Map<String, dynamic>),
    );
  }
}

class RatingModel {
  final double rating;
  final int count;

  RatingModel({required this.rating, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rating: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'] as int,
    );
  }
}
