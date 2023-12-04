import 'package:either_dart/either.dart';
import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../../network_loader/provider/network_loader_provider.dart';
import '../models/product_model.dart';
import '../repository/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  // This code fetches products from the database and stores them in the _products variable.
  Either<List<ProductModel>, Exception> _products =
      Right(FetchingDataException());
  Either<List<ProductModel>, Exception> get products => _products;

  // This variable is used to track the current index of the indicator bar.
  int currentIndex = 1;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  set products(Either<List<ProductModel>, Exception> value) {
    _products = value;
    notifyListeners();
  }

  // Fetches the product details from the API.
  void fetchProducts(BuildContext context) async {
    products = await fetchProductDetailsApi(context);
  }

  // MOCKING POST API CALL..
  Future<void> saveSelectedProducts(BuildContext context) async {
    if (selectedProductIds.isEmpty) {
      FancySnackbar.showSnackbar(
        context,
        title: 'No Product Selected!',
        message: 'Please select at least one product to save.',
        snackBarType: FancySnackBarType.error,
      );
      return;
    }
    Provider.of<NetworkLoaderProvider>(context, listen: false).isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Provider.of<NetworkLoaderProvider>(context, listen: false).isLoading =
          false;

      String savedProducts = '';
      for (int i = 0; i < selectedProductIds.length; i++) {
        if (products.isLeft) {
          products.left
              .where((element) =>
                  int.parse(element.id ?? '0') == selectedProductIds[i])
              .map((e) {
            if (savedProducts.isNotEmpty) {
              savedProducts += ', ';
            }
            savedProducts += '${e.name}';
          }).toList();
        }
      }
      changeCurrentIndex(currentIndex + 1);
      FancySnackbar.showSnackbar(
        context,
        title: 'Saved Successfully!',
        message: 'You have successfully saved $savedProducts',
        snackBarType: FancySnackBarType.success,
      );
    }
  }

  // The selected product ids are used to track which products the user has selected.
  List<int> _selectedProductIds = [];
  List<int> get selectedProductIds => _selectedProductIds;
  set selectedProductIds(List<int> value) {
    _selectedProductIds = value;
    notifyListeners();
  }

  // This function adds the selected product id to the list.
  void addSelectedProductId(int id) {
    _selectedProductIds.add(id);
    notifyListeners();
  }

  // This function removes the selected product id from the list.
  void removeSelectedProductId(int id) {
    _selectedProductIds.removeWhere((element) => element == id);
    notifyListeners();
  }

  // This function checks whether a product is selected or not.
  bool checkIsProductSelected(int id) {
    return _selectedProductIds.contains(id);
  }
}
