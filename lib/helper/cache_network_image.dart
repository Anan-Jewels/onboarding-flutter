import 'package:cached_network_image/cached_network_image.dart';
import 'package:anan_onboarding/presentation/widgets/Shimmer/widgets/rectangle.dart';
import 'package:flutter/cupertino.dart';

class CacheNetworkImageWidget {
  static CachedNetworkImage cachedNetworkImage(
      {required String imageUrl,
      required double width,
      BoxFit? boxFit,
      required double height}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      fit: boxFit ?? BoxFit.fill,
      height: height,
      placeholderFadeInDuration: const Duration(milliseconds: 500),
      placeholder: (context, url) => RectangleShimmering(
        width: width,
        radius: 16.0,
        height: height,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/yours_pace_holder.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
