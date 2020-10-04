import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsResponse>> getNews({@required String category});
}
