import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/core/models/product_mode.dart';

void main() {
  group('ProductMode.fromJson', () {
    test('parses a string price when rating is omitted', () {
      final product = ProductMode.fromJson({
        'id': 1,
        'title': 'test',
        'price': '109.95',
        'description': 'description',
        'image': 'image-url',
        'category': "men's clothing",
      });

      expect(product.price, 109.95);
      expect(product.rating, isNull);
    });

    test('parses numeric price and rating data', () {
      final product = ProductMode.fromJson({
        'id': 1,
        'title': 'test',
        'price': 109.95,
        'description': 'description',
        'image': 'image-url',
        'category': "men's clothing",
        'rating': {'rate': 4.5, 'count': 120},
      });

      expect(product.price, 109.95);
      expect(product.rating?.rating, 4.5);
      expect(product.rating?.count, 120);
    });
  });
}
