import 'package:flutter/material.dart';
import 'package:story_app/core/widgets/custom_app_bar.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'update Product', centerTitle: true),
    );
  }
}
