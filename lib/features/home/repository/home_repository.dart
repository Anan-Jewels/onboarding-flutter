import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models/product_model.dart';

Future<Either<List<ProductModel>, Exception>> fetchProductDetailsApi(
    BuildContext context) async {
  Either<dynamic, Exception> response = await API.callAPI(context,
      url: APIUtilities.productUrl, type: APIType.tGet);

  if (response.isLeft) {
    List productListJson = response.left['data'];

    return Left(productListJson
        .map((e) => ProductModel.fromJson(e)
            .copyWith(id: DateTime.now().microsecondsSinceEpoch.toString()))
        .toList());
  } else {
    return Right(response.right);
  }
}
