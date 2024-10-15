import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/constants/color_constants.dart';
import 'package:kraken_animelist/core/constants/design_constants.dart';
import 'package:kraken_animelist/core/constants/typo_constans.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: ColorConstants.kWhiteColor,
  primaryColor: ColorConstants.kBlackColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorConstants.kBlackColor,
      foregroundColor: ColorConstants.kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignConstants.kRadius8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: DesignConstants.kDefaultPadding12,
        horizontal: DesignConstants.kDefaultPadding32,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: ColorConstants.kBlackColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignConstants.kRadius8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: DesignConstants.kDefaultPadding12,
        horizontal: DesignConstants.kDefaultPadding32,
      ),
      backgroundColor: ColorConstants.kWhiteColor,
      foregroundColor: ColorConstants.kBlackColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.kTransparentColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: ColorConstants.kBlackColor),
    titleTextStyle: TextStyle(
      color: ColorConstants.kBlackColor,
      fontWeight: TypoConstants.kBold,
      fontSize: TypoConstants.kHeadline2FontSize,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: TypoConstants.kHeadline1FontSize,
      fontWeight: TypoConstants.kBold,
      color: ColorConstants.kBlackColor,
    ),
    displayMedium: TextStyle(
      fontSize: TypoConstants.kHeadline2FontSize,
      fontWeight: TypoConstants.kSemiBold,
      color: ColorConstants.kBlackColor,
    ),
    bodyLarge: TextStyle(
      fontSize: TypoConstants.kBody1FontSize,
      fontWeight: TypoConstants.kRegular,
      color: ColorConstants.kBlackColor,
    ),
    bodyMedium: TextStyle(
      fontSize: TypoConstants.kBody2FontSize,
      fontWeight: TypoConstants.kLight,
      color: ColorConstants.grayColor.shade700,
    ),
  ),
  iconTheme: const IconThemeData(
    color: ColorConstants.kBlackColor,
    size: TypoConstants.kIconSize24,
  ),
  dividerColor: ColorConstants.grayColor.shade400,
  cardColor: ColorConstants.kWhiteColor,
  colorScheme: ColorScheme.light(
    primary: ColorConstants.kBlackColor,
    secondary: ColorConstants.grayColor.shade700,
    background: ColorConstants.kWhiteColor,
    surface: ColorConstants.kWhiteColor,
  ),
);

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}