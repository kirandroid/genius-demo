import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';

part 'core_enums.g.dart';

@HiveType(typeId: THEME_TYPE_TID)
enum ThemeType {
  @HiveField(0)
  dark,
  @HiveField(1)
  light,
}

enum DataSource {
  local,
  remote,
}
