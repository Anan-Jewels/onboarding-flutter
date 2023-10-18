import 'package:flutter/material.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/screens/product_listing_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ANAN JEWELS ASSIGNMENT',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/shantanu-gupta-183773167/'));
              },
              child: const Text(
                'By - Shantanu Gupta',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProductListingScreen()));
                },
                child: Container(
                  height: 40.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      'Go Ahead',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
