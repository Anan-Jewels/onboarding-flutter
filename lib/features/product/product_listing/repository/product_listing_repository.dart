import 'package:onboarding_flutter/core/network/network_response.dart';
import 'package:onboarding_flutter/features/product/product_listing/data/product.dart';

abstract class ProductListingRepository {
  Future<NetworkResponse<List<Product>>> fetchProducts();
}
