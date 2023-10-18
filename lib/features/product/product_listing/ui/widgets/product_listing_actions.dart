import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/features/product/product_listing/bloc/product_listing_bloc.dart';

class ProductListingActions extends StatelessWidget {
  const ProductListingActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Container(
                  height: 34.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(
                        width: 0.5,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Previous',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<ProductListingBloc>(context)
                  .add(OnTapNextEvent(context: context));
            },
            child: Row(
              children: [
                const Text(
                  'Next',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: 34.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
