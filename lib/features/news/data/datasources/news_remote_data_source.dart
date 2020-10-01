import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getLatestNews();
}
