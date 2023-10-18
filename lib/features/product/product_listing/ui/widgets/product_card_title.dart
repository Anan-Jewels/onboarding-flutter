
import 'package:flutter/material.dart';
import 'package:onboarding_flutter/features/product/product_listing/data/product.dart';

class ProductCardTitle extends StatelessWidget {
  final Product product;
  const ProductCardTitle({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name,
      maxLines: 2,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.w300),
    );
  }
}
