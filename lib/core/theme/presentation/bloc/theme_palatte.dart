import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/theme/presentation/bloc/core_palatte.dart';

class ThemePalatte {
  final Color background;
  final CorePalatte corePalatte;
  final ThemeType themeType;
  ThemePalatte({
    @required this.background,
    @required this.themeType,
    this.corePalatte = const CorePalatte(
      buttonColor: Color(0xFF129E71),
    ),
  });
  static ThemePalatte get lightThemePalatte => ThemePalatte(
        background: const Color(0xFFFFFFFF),
        themeType: ThemeType.light,
      );
  static ThemePalatte get darkThemePalatte => ThemePalatte(
        background: const Color(0xFF0A1A1E),
        themeType: ThemeType.dark,
      );
}
