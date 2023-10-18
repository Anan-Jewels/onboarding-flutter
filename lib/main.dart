import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/screens/product_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color(0XFFEAEBEB),
      primaryColorDark: const Color(0XFF737B83),
      textTheme: GoogleFonts.manropeTextTheme(),),
      home: const ProductListingScreen(),
    );
  }
}
