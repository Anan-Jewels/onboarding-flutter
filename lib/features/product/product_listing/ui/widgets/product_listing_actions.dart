import 'package:flutter/material.dart';

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
          Row(
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
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'Previous',
                style: TextStyle(fontSize: 20.0),
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
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
