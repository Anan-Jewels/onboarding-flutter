import 'package:anan_onboarding/main.dart';
import 'package:anan_onboarding/models/design_styles.dart';
import 'package:anan_onboarding/presentation/widgets/check_dot.dart';
import 'package:anan_onboarding/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StyleCard extends StatelessWidget {
  final DesignStyles style;
  final GestureTapCallback onTap;
  final bool isSelected;
  const StyleCard({
    Key? key,
    required this.style,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      context.greyColor(),
                      BlendMode.saturation,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ImageWidget(
                          style.image ?? '',
                          fit: BoxFit.cover,
                          width: 103,
                          height: 103,
                        )),
                  ),
                ),
                AnimatedPositioned(
                  right: 8.0,
                  top: 8.0,
                  duration: const Duration(milliseconds: 350),
                  child: CheckDot(
                    isSelected: isSelected,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              style.name?.inCaps ?? '--',
              style: context.customStyle(
                fontWeight: FontWeight.w500,
                size: 12.0,
                color: context.textColor(),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 350.ms).then().slideY(
          duration: 350.ms,
          begin: 0.25,
          end: 0.0,
        );
  }
}
