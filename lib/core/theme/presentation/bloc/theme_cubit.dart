import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/theme/domain/usecases/apply_theme.dart';
import 'package:genius_demo/core/theme/domain/usecases/get_theme.dart';
import 'package:genius_demo/core/theme/presentation/bloc/core_palatte.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_palatte.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemePalatte> {
  final ApplyTheme applyTheme;
  final GetTheme getTheme;

  ThemeCubit({
    @required ApplyTheme changeTheme,
    @required GetTheme fetchTheme,
  })  : applyTheme = changeTheme,
        getTheme = fetchTheme,
        super(ThemePalatte.lightThemePalatte);

  Future fetchTheme() async {
    final failureOrThemeType = await getTheme.fromLocal();
    final themePalatte = failureOrThemeType.fold(
      (Failure failure) => ThemePalatte.lightThemePalatte,
      (ThemeType themeType) => themeType.palatte,
    );
    return emit(themePalatte);
  }

  /// [themeType] is current theme
  void switchTheme(ThemeType themeType) async {
    final desiredTheme =
        themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    final failureOrThemeType = await applyTheme.locally(desiredTheme);
    final themePalatte = failureOrThemeType.fold(
      (Failure failure) => ThemePalatte.lightThemePalatte,
      (bool success) {
        return desiredTheme.palatte;
      },
    );
    return emit(themePalatte);
  }
}

extension _ThemePalatteExtension on ThemeType {
  ThemePalatte get palatte {
    switch (this) {
      case ThemeType.light:
        return ThemePalatte.lightThemePalatte;
        break;
      case ThemeType.dark:
        return ThemePalatte.darkThemePalatte;
        break;
      default:
        return ThemePalatte.lightThemePalatte;
    }
  }
}
