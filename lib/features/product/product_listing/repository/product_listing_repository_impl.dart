import 'package:onboarding_flutter/core/network/dio_client.dart';
import 'package:onboarding_flutter/core/network/network_response.dart';
import 'package:onboarding_flutter/features/product/product_listing/data/product.dart';
import 'package:onboarding_flutter/features/product/product_listing/repository/product_listing_repository.dart';

class ProductListingRepositoryImpl implements ProductListingRepository {
  @override
  Future<NetworkResponse<List<Product>>> fetchProducts() async {
    try {
      var apiRes = await DioClient.instance.get(
          path:
              'https://6525210567cfb1e59ce6ae75.mockapi.io/api/v1/designstyles');
      if (apiRes.isEmpty || apiRes['error'] != null) {
        return NetworkResponse.fail(apiRes['error']);
      } else {
        final List<Product> products = [];
        var resData = apiRes['data'];
        for (var data in resData) {
          products.add(Product.fromJson(data));
        }
        return NetworkResponse.success(products);
      }
    } catch (e) {
      return NetworkResponse.fail(e);
    }
  }
  
  @override
  Future<NetworkResponse<List<Product>>> updateProducts(List<Product> products) async{
    try {
      var apiRes = await DioClient.instance.get(
          path:
              'UPDATE_POST_URL');
      if (apiRes.isEmpty || apiRes['error'] != null) {
        return NetworkResponse.fail(apiRes['error']);
      } else {
        return NetworkResponse.success(products);
      }
    } catch (e) {
      return NetworkResponse.fail(e);
    }
  }
}
