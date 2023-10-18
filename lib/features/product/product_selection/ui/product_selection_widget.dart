import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_flutter/features/product/product_selection/cubit/product_selection_cubit.dart';

class ProductSelectionWidget extends StatelessWidget {
  final String id;
  const ProductSelectionWidget({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, Map<String, bool>>(
        builder: (context, state) {
      return state[id] ?? false
          ? InkWell(
              onTap: () {
                BlocProvider.of<ProductSelectionCubit>(context).deselect(id);
              },
              child: Icon(
                Icons.check_circle,
                color: Color(0XFF737B83),
              ),
            )
          : InkWell(
              onTap: () {
                BlocProvider.of<ProductSelectionCubit>(context).select(id);
              },
              child: Icon(
                Icons.circle_outlined,
                color: Colors.grey.shade700,
              ),
            );
    });
  }
}
