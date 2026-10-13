import 'package:flutter/material.dart';
import 'package:story_app/core/models/product_mode.dart';

class CustomCard extends StatelessWidget {
  final ProductMode product;
  const CustomCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withValues(alpha: .2),
                spreadRadius: 0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.title.substring(0, 6),
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$'
                        '${product.price.toString()}',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          top: -65,
          child: Image.network(product.image, height: 100, width: 100),
        ),
      ],
    );
  }
}
