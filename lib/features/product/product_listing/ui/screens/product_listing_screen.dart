import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/features/product/product_listing/bloc/product_listing_bloc.dart';

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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose some design styles that you would prefer.',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 24.0,
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
                                      Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0XFFEAEBEB),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              Colors.grey,
                                              BlendMode.saturation,
                                            ),
                                            child: Image.network(
                                                state.products[index].image),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 2.0,
                                          top: 2.0,
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.grey.shade700,
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    child: Text(
                                      state.products[index].name,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
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
