import 'package:cuoiki/firebase_options.dart';
import 'package:cuoiki/page/cart_page.dart';
import 'package:cuoiki/page/menu_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cuoiki/models/shop.dart';
import 'package:provider/provider.dart';
import 'page/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        './intropage': (context) => const IntroPage(),
        './menupage': (context) => const MenuPage(
              [],
            ),
        './cartpage': (context) => const CartPage(),
      },
    );
  }
}
