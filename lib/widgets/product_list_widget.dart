import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/product_view_page.dart';
import '../utils/app_colors.dart';
import 'build_text_widget.dart';

class ProductListWidget extends StatefulWidget {
  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  List<Map<String, dynamic>> products = [];
  bool isLoading = true;

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('products').get();

      List<Map<String, dynamic>> fetchedProducts = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        return {
          "name": data["name"] ?? "No Name",
          "price": data["price"]?.toString() ?? "\$0",
          "image": data["image"] ?? "",
          "discription": data["discription"] ?? "No description",
        };
      }).toList();

      setState(() {
        products = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching products: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: AppColors.red,))
        : products.isEmpty
        ? Center(child: Text("No products available"))
        : GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductViewPage(
                  name: products[index]["name"],
                  price: products[index]["price"],
                  image: products[index]["image"],
                  description: products[index]["discription"],
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white_origin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(10)),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.network(
                        products[index]["image"],
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.image_not_supported,
                              size: 50, color: Colors.grey);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildTextWidget(
                            text: products[index]["name"] ?? "No Name",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          BuildTextWidget(
                            text: products[index]["price"] ?? "\$0",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 4),
                          BuildTextWidget(
                            text: products[index]["discription"] ??
                                "No description",
                            fontSize: 12,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
