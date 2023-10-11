import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../shimmering.dart';

class HorizontalShimmeringList extends StatelessWidget {
  final double? width;
  final double? height;
  final Axis? direction;

  const HorizontalShimmeringList(
      {Key? key, this.width, this.height, this.direction = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      scrollDirection: direction!,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: ShimmerWidget.rectangle(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
