import 'package:flutter/material.dart';
import 'package:shopywelll/screens/place_order_page.dart';

import '../utils/app_colors.dart';
import '../widgets/address_selection_widget.dart';
import '../widgets/build_text_widget.dart';

class CheckoutPage extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final String description;

  const CheckoutPage({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.description, required String price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.ScaffoldColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Checkout"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextWidget(
              text: 'Delivery Address',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            AddressSelectionWidget(),
            SizedBox(height: 20),
            BuildTextWidget(
              text: 'Shopping List',
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceOrderPage(
                      productName: productName,
                      productPrice: productPrice,
                      productImage: productImage,
                      description: description,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productImage,
                        width: 130,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$$productPrice",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
