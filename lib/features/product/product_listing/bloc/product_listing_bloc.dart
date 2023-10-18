import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/core/network/network_response.dart';
import 'package:onboarding_flutter/features/product/product_listing/data/product.dart';
import 'package:onboarding_flutter/features/product/product_listing/repository/product_listing_repository.dart';
import 'package:onboarding_flutter/features/product/product_listing/repository/product_listing_repository_impl.dart';
import 'package:onboarding_flutter/features/product/product_selection/cubit/product_selection_cubit.dart';

part 'product_listing_event.dart';
part 'product_listing_state.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  final ProductListingRepository _productListingRepository =
      ProductListingRepositoryImpl();
  final ProductSelectionCubit _productSelectionCubit = ProductSelectionCubit();
  ProductListingBloc() : super(ProductListingLoadingState()) {
    on<LoadProductListingEvent>((event, emit) => _loadLListing(event, emit));
    on<OnTapNextEvent>((event, emit) => _onTapNext(event, emit));
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

  void _onTapNext(
      OnTapNextEvent event, Emitter<ProductListingState> emit) async {
    var selectionState = _productSelectionCubit.state;
    var loadedState = state as ProductListingLoadedState;
    var products = loadedState.products;
    List<String> selected = [];
    for (var product in products) {
      if (selectionState[product.id] == true) {
        selected.add(product.name);
      }
    }

    if (selected.length >= 3) {
      ScaffoldMessenger.of(event.context).clearSnackBars();
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(
              'You have successfully saved ${selected.first}, ${selected[1]} and ${selected.length - 2} others.')));
    } else if (selected.length == 2) {
      ScaffoldMessenger.of(event.context).clearSnackBars();
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(
              'You have successfully saved ${selected.first}, ${selected[1]}.')));
    } else if (selected.length == 1) {
      ScaffoldMessenger.of(event.context).clearSnackBars();
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text('You have successfully saved ${selected.first}.')));
    } else {
      ScaffoldMessenger.of(event.context).clearSnackBars();
      ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(content: Text('You have not selected any product')));
    }
  }

  ProductSelectionCubit get selectionCubit => _productSelectionCubit;
}
