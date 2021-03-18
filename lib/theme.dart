import 'package:custom_theme/color_styles.dart';
import 'package:custom_theme/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    // Typography
    final originTypography = (Typography.material2018(platform: defaultTargetPlatform).black)
        .merge(Typography.material2018(platform: defaultTargetPlatform).dense);

    final typography = originTypography.copyWith(
      // About's applicationName, DatePicker
      headline5: originTypography.headline6.merge(AppTextStyles.header), // 24.0 -> 22.0
      // AppBar's title
      headline6: originTypography.headline6.merge(AppTextStyles.title), // 21.0 -> 18.0
      // TextFormField's hintStyle, DropdownButton, ListTile's title
      subtitle1: originTypography.subtitle1.merge(AppTextStyles.main), // 17.0 -> 14.0
      // ListTile on Drawer, NavigationRail, TabBar
      bodyText1: originTypography.bodyText2.merge(AppTextStyles.main), // 17.0 -> 14.0
      // Text, ListTile's subtitle
      bodyText2: originTypography.bodyText2.merge(AppTextStyles.main), // 15.0 -> 14.0
      // Button
      button: originTypography.caption.merge(AppTextStyles.main), // 15.0 -> 14.0
      // TextFormField's errorStyle, helperStyle
      caption: originTypography.caption.merge(AppTextStyles.caption), // 13.0 -> 11.0
    );

    // Theme

    final originThemeData = ThemeData.light();

    final theme = originThemeData.copyWith(
      errorColor: AppColorStyles.alert,
      hintColor: AppColorStyles.hint,
      accentColor: AppColorStyles.primary,
      cardColor: AppColorStyles.white,
      dividerColor: AppColorStyles.glay,
      shadowColor: AppColorStyles.glay,
      disabledColor: AppColorStyles.glay,
      canvasColor: AppColorStyles.white,
      toggleableActiveColor: AppColorStyles.primary,
      unselectedWidgetColor: AppColorStyles.glay,
      primaryColor: AppColorStyles.primary, // AppBar Color.
      bottomAppBarColor: AppColorStyles.primary,
      colorScheme: originThemeData.colorScheme.copyWith(
        primary: AppColorStyles.primary, // Button, DatePicker
        secondary: AppColorStyles.primary, // FAB
      ),
      textTheme: typography,
      // primaryTextTheme: typography,
      appBarTheme: originThemeData.appBarTheme.copyWith(
        color: AppColorStyles.white,
        elevation: 0.0,
        textTheme: TextTheme(headline6: typography.headline6),
        iconTheme: originThemeData.accentIconTheme.copyWith(color: AppColorStyles.black),
      ),
      cardTheme: originThemeData.cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColorStyles.primary, // background
          onPrimary: AppColorStyles.white, // foreground(text)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 0,
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) return AppColorStyles.primary.withOpacity(0.6);
              return AppColorStyles.white;
            },
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColorStyles.white, // background fillColor
          side: BorderSide(color: AppColorStyles.black, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(color: AppColorStyles.glay, width: 0.5);
              }
              return BorderSide(color: AppColorStyles.primary, width: 0.5);
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: AppColorStyles.black, // text
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) return AppColorStyles.glay;
              return AppColorStyles.black;
            },
          ),
        ),
      ),
      inputDecorationTheme: originThemeData.inputDecorationTheme.copyWith(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: AppColorStyles.primary),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: AppColorStyles.alert),
          borderRadius: BorderRadius.circular(4.0),
        ),
        filled: true,
        fillColor: AppColorStyles.glay,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );

    return theme;
  }

  static ThemeData get darkTheme {
    // return ThemeData.dark();
    return theme;
  }
}
