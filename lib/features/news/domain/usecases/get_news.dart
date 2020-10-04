import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';

class GetNews implements UseCase {
  final NewsRepository repository;

  GetNews({this.repository});

  @override
  Future<Either<Failure, NewsResponse>> call(
      {@required String category}) async {
    return repository.getNews(category: category);
  }
}
