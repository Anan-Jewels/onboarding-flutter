import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../../network_loader/page/network_loader.dart';
import '../models/product_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).fetchProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkLoader(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          actions: [
            Container(
              color: transparentColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                'Skip',
                style: FontUtilities.style(
                  fontSize: 16,
                  fontWeight: FWT.medium,
                  fontColor: neutral800Color,
                ),
              ),
            ),
          ],
        ),
        body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
          if (homeProvider.products is Right) {
            if (homeProvider.products.right is FetchingDataException) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(blackColor),
                  ),
                  const SizedBox(
                    height: 8,
                    width: double.infinity,
                  ),
                  Text(
                    'Fetching data...',
                    style: FontUtilities.style(
                      fontSize: 16,
                      fontWeight: FWT.medium,
                      fontColor: neutral800Color,
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Text(
                'Something went wrong',
                style: FontUtilities.style(
                  fontSize: 16,
                  fontWeight: FWT.medium,
                  fontColor: neutral800Color,
                ),
              ),
            );
          }

          List<ProductModel> products = homeProvider.products.left;
          return Column(
            children: [
              Expanded(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pick your favourite products',
                            style: FontUtilities.style(
                              fontSize: 20,
                              fontWeight: FWT.medium,
                              fontColor: neutral900Color,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Select upto ${homeProvider.selectedProductIds.length} out of ${products.length}',
                            style: FontUtilities.style(
                              fontSize: 14,
                              fontWeight: FWT.medium,
                              fontColor: neutral700Color,
                            ),
                          ),
                          const SizedBox(height: 24),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              int productId =
                                  int.parse(products[index].id ?? '0');
                              bool isProductSelected = homeProvider
                                  .checkIsProductSelected(productId);
                              return LayoutBuilder(
                                  builder: (context, boxConstraints) {
                                double width = boxConstraints.maxWidth;
                                return GestureDetector(
                                  onTap: () {
                                    if (isProductSelected) {
                                      homeProvider
                                          .removeSelectedProductId(productId);
                                    } else {
                                      homeProvider
                                          .addSelectedProductId(productId);
                                    }
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: width,
                                            height: width,
                                            decoration: BoxDecoration(
                                              color: grayColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: isProductSelected
                                                  ? Border.all(
                                                      color: primaryColor,
                                                      width: 1.5,
                                                    )
                                                  : null,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                products[index].image ??
                                                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          if (isProductSelected) ...{
                                            Positioned(
                                              top: 4,
                                              right: 4,
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: neutral800Color,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.check,
                                                  color: whiteColor,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          },
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        products[index].name ?? '',
                                        style: FontUtilities.style(
                                          fontSize: 12,
                                          fontColor: neutral800Color,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(
                      height: 0,
                      thickness: 1.5,
                      color: grayColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(9, (index) {
                        double indicatorSize =
                            index == homeProvider.currentIndex ? 10 : 8;
                        return ClipPath(
                          clipper: HexagonClipper(),
                          child: Container(
                            width: indicatorSize,
                            height: indicatorSize,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            color: index == homeProvider.currentIndex
                                ? primaryColor
                                : grayColor,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: homeProvider.currentIndex == 0
                            ? MainAxisAlignment.end
                            : homeProvider.currentIndex == 8
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                        children: [
                          if (homeProvider.currentIndex != 0) ...{
                            CustomFlatButton(
                              title: "Previous",
                              isPrevious: true,
                              color: whiteColor,
                              onTap: () {
                                homeProvider.changeCurrentIndex(
                                    homeProvider.currentIndex - 1);
                              },
                            ),
                          },
                          if (homeProvider.currentIndex != 8) ...{
                            CustomFlatButton(
                              title: 'Next',
                              onTap: () async {
                                await homeProvider
                                    .saveSelectedProducts(context);
                              },
                            ),
                          },
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    /// create hexagon path
    path
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 3)
      ..lineTo(size.width, size.height * 2 / 3)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height * 2 / 3)
      ..lineTo(0, size.height / 3)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
