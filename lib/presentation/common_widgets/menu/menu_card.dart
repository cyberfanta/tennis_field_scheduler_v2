import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../behaviors/ontap_wrapper.dart';
import 'menu_cubit.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.index,
    required this.itemWidth,
    required this.itemHeight,
    required this.imageSelected,
    required this.imageUnselected,
    required this.text,
    required this.actionsToDo,
  });

  final int index;
  final double itemWidth;
  final double itemHeight;
  final String imageSelected;
  final String imageUnselected;
  final String text;
  final void Function() actionsToDo;

  @override
  Widget build(BuildContext context) {
    return OnTapWrapper(
      widgetToWrap: BlocBuilder<MenuCubit, int>(
        builder: (context, value) {
          return Container(
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
              color: value == index
                  ? cMenuBackgroundSelected
                  : cMenuBackgroundUnSelected,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                SvgPicture.asset(
                  value == index ? imageSelected : imageUnselected,
                  height: 21,
                  fit: BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(
                    value == index
                        ? cMenuForegroundSelected
                        : cMenuForegroundUnSelected,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: value == index
                      ? styleSemiBold(12, cMenuForegroundSelected)
                      : styleRegular(12, cMenuForegroundUnSelected),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
              ],
            ),
          );
        },
      ),
      actionsToDo: actionsToDo,
    );
  }
}
