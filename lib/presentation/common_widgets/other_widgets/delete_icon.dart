import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/theme/ui_colors.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/delete.svg",
      height: 50,
      colorFilter: const ColorFilter.mode(
        cWhite,
        BlendMode.srcIn,
      ),
    );
  }
}
