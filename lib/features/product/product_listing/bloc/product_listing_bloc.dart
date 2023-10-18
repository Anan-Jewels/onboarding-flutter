import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/core/network/network_response.dart';
import 'package:onboarding_flutter/features/product/product_listing/data/product.dart';
import 'package:onboarding_flutter/features/product/product_listing/repository/product_listing_repository.dart';
import 'package:onboarding_flutter/features/product/product_listing/repository/product_listing_repository_impl.dart';

part 'product_listing_event.dart';
part 'product_listing_state.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  final ProductListingRepository _productListingRepository =
      ProductListingRepositoryImpl();
  ProductListingBloc() : super(ProductListingLoadingState()) {
    on<LoadProductListingEvent>((event, emit) => _loadLListing(event, emit));
  }

  void _loadLListing(
      LoadProductListingEvent event, Emitter<ProductListingState> emit) async {
    try {
      var data = await _productListingRepository.fetchProducts();
      if (data is Success) {
        emit(ProductListingLoadedState(products: (data as Success).data));
      } else {
        emit(ProductListingErrorState(
            errorMsg: (data as Fail).error.toString()));
      }
    } catch (e) {
      emit(ProductListingErrorState(errorMsg: 'Something went wront $e'));
    }
  }
}
