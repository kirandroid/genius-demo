import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNews({@required String category});
  Future<void> saveNews({NewsResponse newsResponse, @required String category});
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<NewsResponse> getNews({@required String category}) async {
    final newsBox = await openBox(NEWS_BOX);
    if (newsBox.isNotEmpty) {
      final articles = await newsBox.get(category);
      return NewsResponse(articles: articles.cast<Articles>());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveNews({NewsResponse newsResponse, String category}) async {
    final newsBox = await openBox(NEWS_BOX);
    await newsBox.put(category, newsResponse.articles);
  }
}
