import 'package:anan_onboarding/helper/Helper.dart';
import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ImageWidget extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final double? labelTopPosition;
  final bool isDissabled;
  final bool showAspect;
  final String? tagLabel;
  final String? itemType;
  final Color? tagBackgroundColor;
  final double? tagFontSize;
  final EdgeInsetsGeometry? tagPadding;
  final double ratio;

  const ImageWidget(
    this.image, {
    Key? key,
    this.fit,
    this.borderRadius,
    this.height,
    this.width,
    this.isDissabled = false,
    this.tagLabel,
    this.itemType,
    this.tagBackgroundColor,
    this.tagPadding,
    this.tagFontSize,
    this.labelTopPosition,
    this.showAspect = false,
    this.ratio = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final img = CachedNetworkImage(
      imageUrl: image ?? '',
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        foregroundDecoration: isDissabled
            ? const BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : null,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: whiteColor,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.contain,
          ),
        ),
      ),
      errorWidget: (context, _, __) => Center(
        child: Image.asset(
          placeHolder,
          color: placeHolderColor,
          fit: fit ?? BoxFit.contain,
        ),
      ),
      fit: fit ?? BoxFit.contain,
      placeholder: (context, _) => Center(
        child: loadingIcon(
          color: context.greyColor(),
        ),
      ),
    );
    return SizedBox(
      width: width,
      height: width,
      child: AspectRatio(
        aspectRatio: ratio,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  color: greyColor,
                ),
                child: img,
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}
