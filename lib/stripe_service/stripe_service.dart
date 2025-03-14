import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentService {
  static Future<void> makePayment() async {
    try {
      // 1. Create a Payment Intent on your server
      Map<String, dynamic> paymentIntentData = await _createPaymentIntent("1000", "USD");

      if (paymentIntentData == null) {
        throw Exception("Failed to create payment intent");
      }

      // 2. Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          merchantDisplayName: "YourApp",
        ),
      );

      // 3. Display the Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      print("Payment successful!");
    } catch (e) {
      print("Payment failed: $e");
    }
  }

  static Future<Map<String, dynamic>> _createPaymentIntent(String amount, String currency) async {
    try {
      // Your Stripe Secret Key
      String secretKey = "sk_test_51R2Tes2K6Xp3Vq6NZrEBTkD6NIHAbFpMLsRPViPpFstUUxPwsrtazvq29dv13IdhZvwARiBgo0OHgteupAMM3yKc00YOb9KrGo";

      final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          "Authorization": "Bearer $secretKey",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "amount": amount,
          "currency": currency,
          "payment_method_types[]": "card",
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      print("Error creating payment intent: $e");
      return {};
    }
  }
}
