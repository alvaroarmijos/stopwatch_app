import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

class AppThemes {
  AppThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.primaryDark,
    background: AppColors.primaryDark,
  );

  static final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: AppColors.red,
      ),
      borderRadius: BorderRadius.circular(
        AppDimens.dimen_8,
      ),
    ),
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    ).copyWith(
      floatingActionButtonTheme: _floatingActionButtonThemeData,
    );
  }
}
