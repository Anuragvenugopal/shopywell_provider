import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier {
  Map<String, dynamic>? _paymentIntent;
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  Future<void> makePayment(BuildContext context, String amount) async {
    try {
      _isProcessing = true;
      notifyListeners();

      _paymentIntent = await _createPaymentIntent(amount);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: _paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'ShopyWell',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Successful!")),
      );
    } catch (e) {
      print('Payment failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed!")),
      );
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(String amount) async {
    try {
      final url = Uri.parse("https://api.stripe.com/v1/payment_intents");

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'sk_test_51R2Tes2K6Xp3Vq6NZrEBTkD6NIHAbFpMLsRPViPpFstUUxPwsrtazvq29dv13IdhZvwARiBgo0OHgteupAMM3yKc00YOb9KrGo', // Use your Stripe secret key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (double.parse(amount.replaceAll(RegExp(r'[^0-9.]'), '')) * 100).toInt().toString(),
          'currency': 'usd',
          'payment_method_types[]': 'card',
        },
      );

      return jsonDecode(response.body);
    } catch (err) {
      throw Exception("Error creating payment intent: $err");
    }
  }
}
