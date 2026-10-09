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

  factory ProductMode.fromJson(jsonData) {
    return ProductMode(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rating;
  final int count;

  RatingModel({required this.rating, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rating: jsonData['rating'], count: jsonData['count']);
  }
}
