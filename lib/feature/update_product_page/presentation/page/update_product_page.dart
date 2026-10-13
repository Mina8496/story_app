import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:story_app/core/models/product_mode.dart';
import 'package:story_app/core/services/update_product_service.dart';
import 'package:story_app/core/widgets/custom_app_bar.dart';
import 'package:story_app/core/widgets/custom_button.dart';
import 'package:story_app/core/widgets/custom_text_field.dart';

/// Displays a form for editing a product's details.
// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  final ProductMode product;

  const UpdateProductPage({super.key, required this.product});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  // Values entered in the form and the product being edited.
  String? productName, dec, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'update Product', centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Allow the form to scroll when the keyboard or screen size limits space.
            child: Column(
              children: [
                SizedBox(height: 90),
                // Product name
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Product Name',
                  borderSide: BorderSide(color: Colors.black),
                ),
                SizedBox(height: 15),
                // Product description
                CustomTextField(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'description',
                  onChanged: (data) {
                    dec = data;
                  },
                  borderSide: BorderSide(color: Colors.black),
                ),
                SizedBox(height: 15),
                // Product price
                CustomTextField(
                  hintStyle: TextStyle(color: Colors.grey),
                  keyboardType: TextInputType.number,
                  hintText: 'price',
                  onChanged: (data) {
                    price = data;
                  },
                  borderSide: BorderSide(color: Colors.black),
                ),
                SizedBox(height: 15),
                // Product image URL or path
                CustomTextField(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                  borderSide: BorderSide(color: Colors.black),
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: 'update product',
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      updateProduct();
                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct() {
    UpdateProductService().updateProduct(
      title: productName!,
      price: price!,
      doc: dec!,
      image: image!,
      category: widget.product.category,
    );
    isLoading = false;
  }
}
