import 'dart:convert';

import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/utils/keys.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNews({@required String category});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({@required this.client});
  @override
  Future<NewsResponse> getNews({String category}) async {
    final response = await client.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$newsApiKey&page_size=10',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
