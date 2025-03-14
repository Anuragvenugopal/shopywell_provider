import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/build_elivated_button_widget.dart';
import '../widgets/product_view_carosil.dart';
import '../widgets/similar_product_widget.dart';
import '../widgets/size_selector_widget.dart';
import 'checkout_page.dart';

class ProductViewPage extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String description;

  const ProductViewPage({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  List<String> productImages = [];


  @override
  void initState() {
    super.initState();
    productImages = [widget.image, widget.image, widget.image];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.ScaffoldColor,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductViewCarosil(productImages: productImages),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SizeSelectorWidget(
                    sizes: [6, 7, 8, 9, 10],
                    onSizeSelected: (selectedSize) {
                      print("Selected Size: $selectedSize");
                    },
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.price,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: BuildElivatedButtonWidget(
                      text: 'Go to Cart',
                      onPressed: () {},
                      color: AppColors.blue,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: BuildElivatedButtonWidget(
                      text: 'Buy Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              productName: widget.name,
                              productPrice: widget.price,
                              productImage: widget.image,
                              description: widget.description,
                              // size: _selectedSize,
                            ),
                          ),
                        );
                      },
                      color: AppColors.green,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            SimilarProductsWidget(
              productImages: productImages,
              productName: widget.name,
              productPrice: widget.price,
            ),
          ],
        ),
      ),
    );
  }
}
