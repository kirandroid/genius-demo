import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getLatestNews();
  Future<void> saveLatestNews(NewsResponse newsResponse);
}
