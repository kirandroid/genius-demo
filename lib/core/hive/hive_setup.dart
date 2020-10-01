import 'package:genius_demo/core/hive/hive_boxes.dart';
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
  }
}

Future<void> clearHive() async {
  await Hive.deleteBoxFromDisk(NEWS_BOX);
  await Hive.deleteBoxFromDisk(NEWS_ARTICLE_BOX);
  await Hive.deleteBoxFromDisk(NEWS_SOURCE_BOX);
}

Future<LazyBox> openBox(String name) async {
  return Hive.isBoxOpen(name)
      ? Hive.lazyBox(name)
      : await Hive.openLazyBox(name);
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
