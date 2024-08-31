import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';

const String currentFontFamily = "Poppins";
const Color defaultFontColor = cWhite;

TextStyle defaultTextStyle() {
  return const TextStyle(
    color: defaultFontColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: currentFontFamily,
  );
}

TextStyle styleRegular([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
}

TextStyle styleRegularUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

TextStyle styleBold([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
}

TextStyle styleBoldItalic([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.italic,
  );
}

TextStyle styleExtraBold([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
}

TextStyle styleExtraBoldUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

TextStyle styleBoldUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

TextStyle styleSemiBold([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}

TextStyle styleSemiBoldUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

TextStyle styleThin([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w100,
    fontFamily: fontFamily,
  );
}

TextStyle styleExtraLight([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w200,
    fontFamily: fontFamily,
  );
}

TextStyle styleLight([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
  );
}

TextStyle styleLightUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}

TextStyle styleMedium([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
}

TextStyle styleBlack([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
  );
}

TextStyle styleRegularOutline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}

TextStyle styleRegularOutlineUnderline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    decoration: TextDecoration.underline,
    decorationColor: color,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}

TextStyle styleBoldOutline([
  double? fontSize = 12,
  Color? color = defaultFontColor,
  Color? colorOutline = cWhite,
  double? strokeWidth = 2,
  String? fontFamily = currentFontFamily,
]) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), -(strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset((strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
      Shadow(
        offset: Offset(-(strokeWidth ?? 2), (strokeWidth ?? 2)),
        color: colorOutline ?? cWhite,
      ),
    ],
  );
}
