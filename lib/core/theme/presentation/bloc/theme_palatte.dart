import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/theme/presentation/bloc/core_palatte.dart';

class ThemePalatte {
  final Color background;
  final Color surface;
  final Color textColor;
  final CorePalatte corePalatte;
  final ThemeType themeType;
  final Brightness brightness;
  ThemePalatte({
    @required this.background,
    @required this.themeType,
    @required this.textColor,
    @required this.brightness,
    @required this.surface,
    this.corePalatte = const CorePalatte(
      colorPrimary: Color(0xFF129E71),
      colorPrimaryDark: Color(0xFF006E46),
      colorPrimaryLight: Color(0xFF57D0A0),
      colorSecondary: Color(0xFF6478D3),
    ),
  });
  static ThemePalatte get lightThemePalatte => ThemePalatte(
        background: const Color(0xFFEEEEEE),
        surface: const Color(0xFFFFFFFF),
        textColor: const Color(0xFF314045),
        themeType: ThemeType.light,
        brightness: Brightness.light,
      );
  static ThemePalatte get darkThemePalatte => ThemePalatte(
        background: const Color(0xFF333333),
        surface: const Color(0xFF212121),
        textColor: const Color(0xFFEEEEEE),
        themeType: ThemeType.dark,
        brightness: Brightness.dark,
      );
}
