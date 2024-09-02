import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../app_bar/app_bar.dart';
import '../behaviors/ontap_wrapper.dart';
import '../menu/menu.dart';
import '../other_widgets/upper_margin.dart';
import 'error_message_cubit.dart';

class BaseBackground extends StatelessWidget {
  const BaseBackground({
    super.key,
    required this.backActions,
    this.backgroundColor,
    this.backgroundImage = "",
    this.hasBackButton = false,
    this.hasFavoriteButton = false,
    this.hasAppBar = false,
    this.hasMenu = false,
    required this.content,
  });

  final Future<void> Function() backActions;
  final Color? backgroundColor;
  final String backgroundImage;

  final bool hasBackButton;
  final bool hasFavoriteButton;
  final bool hasAppBar;
  final bool hasMenu;

  final Widget content;

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    double sideMargin = 32;
    Size touchingArea = Size(sideMargin + 40, safeAreaTop + 40);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (value, _) async {
        if (value) {
          return;
        }

        await backActions();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor ?? cBackground,
        body: Stack(
          children: [
            backgroundImage.isNotEmpty
                ? Image.asset(
                    backgroundImage,
                    width: screenSize.width,
                    fit: BoxFit.fitWidth,
                  )
                : const SizedBox.shrink(),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: content,
            ),
            hasBackButton
                ? OnTapWrapper(
                    widgetToWrap: Container(
                      width: touchingArea.width,
                      height: touchingArea.height,
                      padding: EdgeInsets.only(
                        top: safeAreaTop,
                        left: sideMargin,
                      ),
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        "assets/images/arrow_back.svg",
                        fit: BoxFit.none,
                      ),
                    ),
                    actionsToDo: backActions,
                  )
                : const SizedBox.shrink(),
            hasFavoriteButton
                ? Align(
                    alignment: Alignment.topRight,
                    child: OnTapWrapper(
                      widgetToWrap: Container(
                        width: touchingArea.width,
                        height: touchingArea.height,
                        padding: EdgeInsets.only(
                          top: safeAreaTop,
                          right: sideMargin,
                        ),
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          "assets/images/favorite.svg",
                          fit: BoxFit.none,
                        ),
                      ),
                      actionsToDo: backActions,
                    ),
                  )
                : const SizedBox.shrink(),
            hasAppBar
                ? Align(
                    alignment: Alignment.topCenter,
                    child: CustomAppBar(
                      safeAreaTop: safeAreaTop,
                      appBarHeight: appBarHeight,
                      uiTexts: uiTexts,
                    ),
                  )
                : const SizedBox.shrink(),
            hasMenu
                ? const Align(
                    alignment: Alignment.bottomCenter,
                    child: Menu(),
                  )
                : const SizedBox.shrink(),
            BlocBuilder<ErrorMessageCubit, String>(
              builder: (context, message) {
                return message.isNotEmpty
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                            color: cBlackOpacity40,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            message,
                            style: styleRegular(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
