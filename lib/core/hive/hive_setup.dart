import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/theme/domain/entities/theme_config.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/movies/domain/entities/genre_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveSetup {
  HiveSetup._();
  static Future get initHive => _initHive();
  static Future _initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(NewsResponseAdapter());
    Hive.registerAdapter(ArticlesAdapter());
    Hive.registerAdapter(SourceAdapter());
    Hive.registerAdapter(ThemeTypeAdapter());
    Hive.registerAdapter(ThemeConfigAdapter());
    Hive.registerAdapter(MoviesResponseAdapter());
    Hive.registerAdapter(ResultsAdapter());
    Hive.registerAdapter(GenreResponseAdapter());
    Hive.registerAdapter(GenresAdapter());
    Hive.registerAdapter(GitHubResponseAdapter());
    Hive.registerAdapter(OwnerAdapter());
  }
}

Future<void> clearHive() async {
  await Hive.deleteBoxFromDisk(THEME_TYPE_BOX);
  await Hive.deleteBoxFromDisk(NEWS_BOX);
  await Hive.deleteBoxFromDisk(NEWS_ARTICLE_BOX);
  await Hive.deleteBoxFromDisk(NEWS_SOURCE_BOX);
  await Hive.deleteBoxFromDisk(THEME_CONFIG_BOX);
  await Hive.deleteBoxFromDisk(MOVIES_BOX);
  await Hive.deleteBoxFromDisk(MOVIES_ITEM_BOX);
  await Hive.deleteBoxFromDisk(GITHUB_BOX);
  await Hive.deleteBoxFromDisk(GITHUB_OWNER_BOX);
}

Future<LazyBox> openBox(String name) async {
  return Hive.isBoxOpen(name)
      ? Hive.lazyBox(name)
      : await Hive.openLazyBox(name);
}

Future<ThemeConfig> getHiveThemeConfigBox() async {
  final userBox = await openBox(THEME_CONFIG_BOX);
  if (userBox.isNotEmpty) {
    return await userBox.getAt(0);
  } else {
    final hiveUser = ThemeConfig();
    await userBox.add(hiveUser);
    return await userBox.getAt(0);
  }
}

Future<NewsResponse> getHiveNewsBox() async {
  final lazyBox = await openBox(NEWS_BOX);
  if (lazyBox.isNotEmpty) {
    return await lazyBox.getAt(0);
  } else {
    const configBox = NewsResponse();
    await lazyBox.add(configBox);
    return await lazyBox.getAt(0);
  }
}
