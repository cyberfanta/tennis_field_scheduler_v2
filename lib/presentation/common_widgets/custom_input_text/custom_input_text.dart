import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/behaviors/ontap_wrapper.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.hint,
    required this.keyboard,
    required this.textInputAction,
    required this.validator,
    required this.hasError,
    required this.errorMessage,
  });

  final String title;
  final String icon;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;
  final TextInputAction textInputAction;
  final bool Function(String) validator;
  final bool hasError;
  final String errorMessage;

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  final ValueNotifier<bool> _isPassVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title.isNotEmpty
                  ? Text(
                      widget.title,
                      style: styleRegular(12, cInputTextTitle),
                    )
                  : const SizedBox.shrink(),
              widget.title.isNotEmpty
                  ? const SizedBox(height: 4)
                  : const SizedBox.shrink(),
              Row(
                children: [
                  Container(
                    width: 15,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      widget.icon,
                      fit: BoxFit.none,
                      colorFilter: const ColorFilter.mode(
                        cBlack,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 1,
                    height: 16,
                    // color: hasError ? cInputTextError : cBlack,
                    color: cBlack,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 20,
                      child: ValueListenableBuilder(
                        valueListenable: _isPassVisible,
                        builder: (context, isVisible, _) {
                          return TextField(
                            controller: widget.controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.hint,
                              hintStyle: styleRegular(14, cBlack),
                            ),
                            cursorColor: cBlack,
                            keyboardType: widget.keyboard,
                            textInputAction: widget.textInputAction,
                            obscureText:
                                (widget.keyboard == TextInputType.visiblePassword) &&
                                    !isVisible,
                            obscuringCharacter: '*',
                            style: styleRegular(14, cBlack),
                            onChanged: widget.validator,
                          );
                        },
                      ),
                    ),
                  ),
                  widget.keyboard == TextInputType.visiblePassword
                      ? const SizedBox(width: 8)
                      : const SizedBox.shrink(),
                  widget.keyboard == TextInputType.visiblePassword
                      ? ValueListenableBuilder(
                          valueListenable: _isPassVisible,
                          builder: (context, isVisible, _) {
                            return OnTapWrapper(
                              widgetToWrap: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  isVisible
                                      ? "assets/images/eye_off.svg"
                                      : "assets/images/eye.svg",
                                  fit: BoxFit.none,
                                  colorFilter: const ColorFilter.mode(
                                    cBlack,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              actionsToDo: () {
                                _isPassVisible.value = !_isPassVisible.value;
                              },
                            );
                          },
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          height: 1,
          color: widget.hasError ? cInputTextError : cInputTextBorder,
        ),
        widget.hasError ? const SizedBox(height: 4) : const SizedBox.shrink(),
        widget.hasError
            ? Text(
                widget.errorMessage,
                style: styleRegular(12, cInputTextError),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
