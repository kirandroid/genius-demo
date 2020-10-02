import 'package:equatable/equatable.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';

part 'theme_config.g.dart';

@HiveType(typeId: THEME_CONFIG_TID)
// ignore: must_be_immutable
class ThemeConfig extends HiveObject implements Equatable {
  @HiveField(0)
  ThemeType themeType;

  ThemeConfig({
    this.themeType,
  });

  @override
  List<Object> get props => [
        themeType,
      ];

  @override
  bool get stringify => true;
}
