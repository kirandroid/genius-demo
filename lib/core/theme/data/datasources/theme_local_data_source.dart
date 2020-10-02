import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeType> getTheme();
  Future<bool> changeTheme(ThemeType themeType);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  //

  @override
  Future<ThemeType> getTheme() async {
    final themeBox = await getHiveThemeConfigBox();
    return themeBox.themeType ?? ThemeType.light;
  }

  @override
  Future<bool> changeTheme(ThemeType themeType) async {
    final themeBox = await getHiveThemeConfigBox();
    themeBox.themeType = themeType;
    await themeBox.save();
    return true;
  }
}
