import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNews();
  Future<void> saveNews(NewsResponse newsResponse);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<NewsResponse> getNews() async {
    final newsBox = await openBox(NEWS_BOX);
    if (newsBox.isNotEmpty) {
      final articles = await newsBox.get('articles');
      return NewsResponse(articles: articles.cast<Articles>());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveNews(NewsResponse newsResponse) async {
    final newsBox = await openBox(NEWS_BOX);
    await newsBox.put('articles', newsResponse.articles);
  }
}
