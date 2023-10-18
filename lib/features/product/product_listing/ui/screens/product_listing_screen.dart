import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/features/product/product_listing/bloc/product_listing_bloc.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/widgets/page_progress_indicator.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/widgets/product_card.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/widgets/product_card_title.dart';
import 'package:onboarding_flutter/features/product/product_listing/ui/widgets/product_listing_actions.dart';
import 'package:onboarding_flutter/features/product/product_selection/ui/product_selection_widget.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  final ProductListingBloc _productListingBloc = ProductListingBloc();

  @override
  void initState() {
    _productListingBloc.add(LoadProductListingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductListingBloc, ProductListingState>(
            bloc: _productListingBloc,
            builder: (context, state) {
              if (state is ProductListingLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductListingLoadedState) {
                return BlocProvider.value(
                  value: _productListingBloc.selectionCubit,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PageProgressIndicator(),
                        const SizedBox(
                          height: 36.0,
                        ),
                        const Text(
                          'Choose some design styles that you would prefer.',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 48.0,
                        ),
                        Expanded(
                          child: GridView.builder(
                              itemCount: state.products.length,
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.80,
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10.0),
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        ProductCard(
                                          product: state.products[index],
                                        ),
                                        Positioned(
                                            right: 2.0,
                                            top: 2.0,
                                            child: ProductSelectionWidget(
                                              id: state.products[index].id,
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12.0),
                                      child: ProductCardTitle(
                                        product: state.products[index],
                                      ),
                                    )
                                  ],
                                );
                              }),
                        ),
                        BlocProvider.value(
                          value: _productListingBloc,
                          child: const ProductListingActions())
                      ],
                    ),
                  ),
                );
              } else if (state is ProductListingErrorState) {
                return Center(
                  child: Text(state.errorMsg),
                );
              } else {
                return const Center(
                  child: Text('This state is not configured'),
                );
              }
            }),
      ),
    );
  }
}
