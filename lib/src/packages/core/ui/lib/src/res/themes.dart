import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

class AppThemes {
  AppThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.primaryDark,
    background: AppColors.primaryDark,
  );

  static final _outlinedButtonTheme = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: _colorSchemeLight.secondary,
    side: BorderSide(
      color: AppColors.red,
      width: 2,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: AppDimens.dimen_16,
      horizontal: AppDimens.dimen_36,
    ),
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 24,
    ),
  );

  static final _outlinedButtonThemeData =
      OutlinedButtonThemeData(style: _outlinedButtonTheme);

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith(
      outlinedButtonTheme: _outlinedButtonThemeData,
    );
  }
}
