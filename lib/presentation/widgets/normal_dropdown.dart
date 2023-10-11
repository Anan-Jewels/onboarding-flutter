import 'package:anan_onboarding/helper/app_constants.dart';
import 'package:anan_onboarding/helper/ui_helpers.dart';
import 'package:anan_onboarding/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NormalDropDown extends StatelessWidget {
  final String text;
  final String? label;
  final bool isFromListing;
  final bool isCenter;
  final GestureTapCallback onTap;
  final bool showIcon;

  const NormalDropDown({
    Key? key,
    required this.text,
    this.label,
    this.isFromListing = false,
    this.isCenter = false,
    this.showIcon = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isFromListing
          ? Container(
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 8.0,
              //   vertical: 4.0,
              // ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: isCenter ? MainAxisSize.min : MainAxisSize.max,
                children: [
                  Text(
                    text,
                    style: context.customMedium(
                      fontWeight: FontWeight.normal,
                      color: context.primaryColor(),
                      size: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: context.primaryColor(),
                    size: 20.0,
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.borderColor(),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null) ...{
                    Text(
                      label!,
                      style: context.customMedium(
                        size: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    UIHelper.verticalSpace(6.0),
                  },
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showIcon) ...{
                        SvgPicture.asset('assets/svg/search.svg'),
                        UIHelper.horizontalSpace(8.0),
                      },
                      Flexible(
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          style: context.customMedium(
                            size: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow_down.svg',
                        height: 6.0,
                        width: 6.0,
                        color: context.borderColor(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class DropDownWithLabel extends StatelessWidget {
  final String text;
  final String? label;
  final GestureTapCallback onTap;
  final GestureTapCallback? onClearTapped;
  final bool showClear;
  final bool showIcon;

  const DropDownWithLabel({
    Key? key,
    required this.text,
    this.label,
    this.showIcon = false,
    this.showClear = false,
    required this.onTap,
    this.onClearTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...{
          Text(
            label!,
            style: context.customMedium(
              size: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          UIHelper.verticalSpace(6.0),
        },
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
              ),
              color: context.white(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (showIcon) ...{
                        SvgPicture.asset(
                          'assets/svg/search.svg',
                          color: Colors.black.withOpacity(0.4),
                          width: 16.0,
                          height: 16.0,
                        ),
                        UIHelper.horizontalSpace(8.0),
                      },
                      Flexible(
                        child: Text(
                          text,
                          overflow: TextOverflow.ellipsis,
                          style: context.customMedium(
                            size: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showClear)
                  InkWell(
                    onTap: onClearTapped,
                    child: const Icon(
                      Icons.close,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  )
                else
                  SvgPicture.asset(
                    'assets/svg/arrow_down.svg',
                    height: 6.0,
                    width: 6.0,
                    color: Colors.black,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
