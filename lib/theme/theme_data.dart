import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    canvasColor: canvasColor,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(
          color: colorWhite,
          fontSize: 2 * SizeConfig.textMultiplier,
        ),
        toolbarTextStyle: const TextStyle(
          color: colorWhite,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        //fixedSize: Size.fromHeight(SizeConfig.heightMultiplier*5),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: secondaryColor,
      unselectedItemColor: colorLightGrey,
      showSelectedLabels: true,
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
        ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      floatingLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: primaryColor,
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}
