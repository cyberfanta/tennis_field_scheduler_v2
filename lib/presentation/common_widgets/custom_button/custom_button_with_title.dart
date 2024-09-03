import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../utils/stamp.dart';
import '../behaviors/ontap_wrapper.dart';

List<ValueNotifier<String>> customButtonWithTitleData =
    List.generate(4, (index) => ValueNotifier(""));

class CustomButtonWithTitle extends StatelessWidget {
  const CustomButtonWithTitle({
    super.key,
    required this.index,
    required this.title,
    required this.hint,
    this.actionsToDo,
  });

  final int index;
  final String title;
  final String hint;
  final void Function()? actionsToDo;

  final String _tag = "CustomButtonWithTitle";

  @override
  Widget build(BuildContext context) {
    return OnTapWrapper(
      widgetToWrap: Container(
        width: double.infinity,
        height: 71,
        decoration: BoxDecoration(
          color: cWhite,
          border: Border.all(color: cCardBorder, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              title,
              style: styleRegular(12, cBlack),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            ValueListenableBuilder(
              valueListenable: customButtonWithTitleData[index],
              builder: (context, item, _) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.isNotEmpty ? item : hint,
                        style:
                            styleRegular(14, item.isNotEmpty ? cBlue : cGray2),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "assets/images/dropdown_closed.svg",
                        width: 20,
                        fit: BoxFit.fitWidth,
                        clipBehavior: Clip.hardEdge,
                        colorFilter: const ColorFilter.mode(
                          cBlack,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    item.isNotEmpty
                        ? OnTapWrapper(
                            widgetToWrap: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                width: 20,
                                "assets/images/x.svg",
                                colorFilter: const ColorFilter.mode(
                                  cBlack,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            actionsToDo: () {
                              stamp(_tag, "Dropdown: $hint - Reset");
                              customButtonWithTitleData[index].value = "";
                            },
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      actionsToDo: () {
        FocusScope.of(context).unfocus();

        actionsToDo!();
      },
    );
  }
}
