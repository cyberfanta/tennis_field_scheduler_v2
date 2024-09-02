import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../utils/stamp.dart';
import '../behaviors/ontap_wrapper.dart';
import 'custom_dropdown_data_cubit.dart';
import 'custom_dropdown_open_cubit.dart';

class CustomDropdownWithTitle extends StatelessWidget {
  const CustomDropdownWithTitle({
    super.key,
    required this.index,
    required this.list,
    required this.title,
    required this.hint,
    this.focusNode,
  });

  final int index;
  final List<String> list;
  final String title;
  final String hint;
  final FocusNode? focusNode;

  final String _tag = "CustomDropdownWithTitle";

  @override
  Widget build(BuildContext context) {
    double height = 50;
    double maxHeight = 42 * 5.7;

    return BlocBuilder<CustomDropdownOpenCubit, List<bool>>(
      builder: (context, isOpen) {
        return BlocBuilder<CustomDropdownDataCubit, List<int>>(
          builder: (context, data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OnTapWrapper(
                  widgetToWrap: Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: cWhite,
                      border: Border.all(color: cCardBorder, width: 1),
                      borderRadius: isOpen[index]
                          ? const BorderRadius.only(
                              topRight: Radius.circular(4),
                              topLeft: Radius.circular(4),
                            )
                          : BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            data[index] != -1
                                ? list[data[index]]
                                : hint,
                            style: styleRegular(14, cBlack),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            width: 20,
                            isOpen[index]
                                ? "assets/images/dropdown_opened.svg"
                                : "assets/images/dropdown_closed.svg",
                            fit: isOpen[index]
                                ? BoxFit.fitHeight
                                : BoxFit.fitWidth,
                            clipBehavior: Clip.hardEdge,
                            colorFilter: const ColorFilter.mode(
                              cBlack,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        data[index] != -1
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
                                  context
                                      .read<CustomDropdownOpenCubit>()
                                      .reset();
                                  context
                                      .read<CustomDropdownDataCubit>()
                                      .reset();
                                },
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  actionsToDo: () {
                    if (focusNode != null) {
                      FocusScope.of(context).requestFocus(focusNode);
                    }

                    if (isOpen[index]) {
                      stamp(_tag, "Dropdown: $hint - Closed");
                      context.read<CustomDropdownOpenCubit>().reset();
                    } else {
                      stamp(_tag, "Dropdown: $hint - Opened");
                      context.read<CustomDropdownOpenCubit>().open(index);
                    }
                  },
                ),
                isOpen[index]
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        constraints: BoxConstraints(maxHeight: maxHeight),
                        decoration: const BoxDecoration(
                          color: cWhite,
                          border: Border(
                            bottom: BorderSide(
                              color: cCardBorder,
                              width: 1,
                            ),
                            left: BorderSide(
                              color: cCardBorder,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: cCardBorder,
                              width: 1,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, indexes) {
                            return OnTapWrapper(
                              widgetToWrap: Container(
                                height: 38,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  list[indexes],
                                  style: styleRegular(12, cBlack),
                                ),
                              ),
                              actionsToDo: () {
                                stamp(_tag,
                                    "Dropdown: $hint - Selected - $indexes: ${list[indexes]}");
                                context.read<CustomDropdownOpenCubit>().reset();
                                context
                                    .read<CustomDropdownDataCubit>()
                                    .updateData(index, indexes);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 4);
                          },
                          itemCount: list.length,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        );
      },
    );
  }
}
