import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getLatestNews();
  Future<void> saveLatestNews(NewsResponse newsResponse);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<NewsResponse> getLatestNews() async {
    final newsBox = await getHiveNewsBox();
    if (newsBox.articles.isNotEmpty) {
      return newsBox;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveLatestNews(NewsResponse newsResponse) async {
    final newsBox = await openBox(NEWS_BOX);
    await newsBox.putAll(newsResponse.toJson());
  }
}
