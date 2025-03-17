// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:shopywelll/screens/onboading/splash_screen.dart';
//
// import 'firebase_options.dart';
//
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Stripe.publishableKey = 'pk_test_51R2Tes2K6Xp3Vq6NGEMcdGco72AVmJlRutPI9liwh5S0xJVyVBmaOoFgI64SKIhhZBJM1Up6PEZ3XAVlqpOdAiMm00DlX5ZTSF';
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(
//     DevicePreview(
//       enabled: false,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       builder: DevicePreview.appBuilder,
//       home: SplashScreen(),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shopywelll/provider/bottom_nav_provider.dart';
import 'package:shopywelll/provider/carosil_provider.dart';
import 'package:shopywelll/provider/choose_page_provider.dart';
import 'package:shopywelll/provider/create_an_account_provider.dart';
import 'package:shopywelll/provider/payment_provider.dart';
import 'package:shopywelll/provider/product_provider.dart';
import 'package:shopywelll/provider/sign_in_provider.dart';
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
      enabled: false,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => CarouselProvider()),
          ChangeNotifierProvider(create: (context) => ChoosePageProvider()),
          ChangeNotifierProvider(create: (context) => CreateAccountProvider()),
          ChangeNotifierProvider(create: (context) => PaymentProvider()),
          ChangeNotifierProvider(create: (context) => PaymentProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => SignInProvider()),
        ],
        child: const MyApp(),
      ),
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
