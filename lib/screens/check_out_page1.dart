import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../stripe_service/stripe_service.dart';
import '../utils/app_colors.dart';
import '../widgets/build_elivated_button_widget.dart';
import '../widgets/build_text_widget.dart';
import '../widgets/payment_option_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CheckoutPage1 extends StatefulWidget {
  final String productPrice;

  const CheckoutPage1({Key? key, required this.productPrice}) : super(key: key);

  @override
  _CheckoutPage1State createState() => _CheckoutPage1State();
}

class _CheckoutPage1State extends State<CheckoutPage1> {
  int selectedPaymentIndex = 0;

  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();

      // Confirm the payment
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'ShopyWell',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      // Payment successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Successful!")),
      );
    } catch (e) {
      print('Payment failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed!")),
      );
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent() async {
    try {
      final url = Uri.parse("https://api.stripe.com/v1/payment_intents");

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'sk_test_51R2Tes2K6Xp3Vq6NZrEBTkD6NIHAbFpMLsRPViPpFstUUxPwsrtazvq29dv13IdhZvwARiBgo0OHgteupAMM3yKc00YOb9KrGo', // Use your Stripe secret key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (double.parse(widget.productPrice.replaceAll(RegExp(r'[^0-9.]'), '')) * 100).toInt().toString(),
          'currency': 'usd',
          'payment_method_types[]': 'card',
        },
      );

      return jsonDecode(response.body);
    } catch (err) {
      throw Exception("Error creating payment intent: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Checkout", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildTextWidget(text: "Order ", fontSize: 18),
                BuildTextWidget(text: widget.productPrice, fontSize: 18),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildTextWidget(text: "Shopping ", fontSize: 18),
                BuildTextWidget(text: "30", fontSize: 18),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildTextWidget(
                  text: "Total ",
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                BuildTextWidget(
                  text: widget.productPrice,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(color: AppColors.grey),
            SizedBox(height: 16),
            Text("Payment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: [
                PaymentOptionWidget(
                  index: 0,
                  selectedIndex: selectedPaymentIndex,
                  logoPath: "assets/images/stripe.png",
                  cardNumber: "********2109",
                  onSelect: (index) {
                    setState(() {
                      selectedPaymentIndex = index;
                    });
                  },
                ),
                PaymentOptionWidget(
                  index: 1,
                  selectedIndex: selectedPaymentIndex,
                  logoPath: "assets/images/apple.png",
                  cardNumber: "********2109",
                  onSelect: (index) {
                    setState(() {
                      selectedPaymentIndex = index;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            BuildElivatedButtonWidget(
              text: "Continue",
              onPressed: () async {
                // await makePayment();
                await StripePaymentService.makePayment();

              },
              color: AppColors.button_color,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
