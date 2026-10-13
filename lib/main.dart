import 'package:flutter/material.dart';
import 'package:story_app/feature/home_page/presentation/page/home_page.dart';
import 'package:story_app/feature/update_product_page/presentation/page/update_product_page.dart';

void main() {
  runApp(const StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UpdateProductPage());
  }
}
