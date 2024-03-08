import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/lib/src/res/colors.dart';

class AppThemes {
  AppThemes._();

  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
    background: AppColors.primary,
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      useMaterial3: true,
    );
  }
}
