import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shopywelll/screens/home_page.dart';
import 'package:shopywelll/screens/onboading/splash_screen.dart';

import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51R2Tes2K6Xp3Vq6NGEMcdGco72AVmJlRutPI9liwh5S0xJVyVBmaOoFgI64SKIhhZBJM1Up6PEZ3XAVlqpOdAiMm00DlX5ZTSF';

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}
