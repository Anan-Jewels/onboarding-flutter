import 'package:anan_onboarding/main.dart';
import 'package:anan_onboarding/models/design_styles.dart';
import 'package:anan_onboarding/presentation/widgets/check_dot.dart';
import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(12.0),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.hue,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        style.image ?? '',
                        fit: BoxFit.cover,
                        width: context.getWidth() * 0.28,
                        height: context.getWidth() * 0.28,
                      ),
                    ),
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
              height: 4.0,
            ),
            Text(
              style.name ?? '--',
              style: context.customStyle(
                fontWeight: FontWeight.normal,
                size: 13.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
