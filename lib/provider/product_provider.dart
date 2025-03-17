import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _products = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get products => _products;
  bool get isLoading => _isLoading;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('products').get();

      _products = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        return {
          "name": data["name"] ?? "No Name",
          "price": data["price"]?.toString() ?? "\$0",
          "image": data["image"] ?? "",
          "discription": data["discription"] ?? "No description",
        };
      }).toList();

      _isLoading = false;
      notifyListeners(); // Notify UI to update
    } catch (e) {
      print("Error fetching products: $e");
      _isLoading = false;
      notifyListeners();
    }
  }
}
