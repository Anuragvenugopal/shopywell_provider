import 'package:flutter/material.dart';
import 'package:shopywelll/widgets/build_text_widget.dart';
import '../utils/app_colors.dart';
import '../widgets/build_elivated_button_widget.dart';
import '../widgets/product_view_carosil.dart';
import '../widgets/similar_product_widget.dart';
import '../widgets/size_selector_widget.dart';
import 'checkout_page.dart';

class ProductViewPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    List<String> productImages = [image, image, image];

    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.ScaffoldColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductViewCarosil(productImages: productImages),
              const SizedBox(height: 10),
              SizeSelectorWidget(
                sizes: [6, 7, 8, 9, 10],
                onSizeSelected: (selectedSize) {
                  print("Selected Size: $selectedSize");
                },
              ),
              const SizedBox(height: 10),
              BuildTextWidget(
                text: name,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              const SizedBox(height: 5),
              BuildTextWidget(
                text: price,
                color: AppColors.red,
                fontSize: 18,
              ),
              const SizedBox(height: 10),
              BuildTextWidget(
                text: description,
                color: AppColors.grey_light,
                fontSize: 14,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: BuildElivatedButtonWidget(
                      text: 'Go to Cart',
                      onPressed: () {},
                      color: AppColors.blue,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BuildElivatedButtonWidget(
                      text: 'Buy Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              productName: name,
                              productPrice: price,
                              productImage: image,
                              description: description,
                              price: price,
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
              const SizedBox(height: 20),
              SimilarProductsWidget(
                productImages: productImages,
                productName: name,
                productPrice: price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
