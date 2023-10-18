part of 'product_listing_bloc.dart';

abstract class ProductListingState {}

class ProductListingLoadingState extends ProductListingState {}

class ProductListingLoadedState extends ProductListingState {
  final List<Product> products;

  ProductListingLoadedState({required this.products});
}

class ProductListingErrorState extends ProductListingState {
  final String errorMsg;

  ProductListingErrorState({required this.errorMsg});
}
