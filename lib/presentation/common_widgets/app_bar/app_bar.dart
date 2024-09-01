import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.safeAreaTop,
    required this.appBarHeight,
    required this.uiTexts,
  });

  final double safeAreaTop;
  final double appBarHeight;
  final UiTexts uiTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF051F44),
            Color(0xFF82BC00),
          ],
          stops: [0.0, 1.0],
          transform: GradientRotation(150),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: safeAreaTop),
          SizedBox(
            height: appBarHeight,
            child: Row(
              children: [
                const SizedBox(width: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      uiTexts.tennis,
                      style: styleSemiBold(18, cWhite),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 60,
                      height: 26,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0x882B513B),
                            Color(0xFFA9F624),
                          ],
                          stops: [0.0, 1.0],
                          transform: GradientRotation(150),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFFA8F522),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: const EdgeInsets.only(right: 14, top: 2),
                          ),
                          Text(
                            uiTexts.court,
                            style: styleRegular(18, cWhite),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
                Image.asset(
                  "assets/images/avatar.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  "assets/images/notifications.svg",
                ),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  "assets/images/menu.svg",
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
