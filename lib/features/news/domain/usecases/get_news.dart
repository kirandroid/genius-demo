import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({this.repository});

  Future<Either<Failure, NewsResponse>> getNewsFromRemote(
      {@required String category}) async {
    return repository.getNewsFromRemote(category: category);
  }

  Future<Either<Failure, NewsResponse>> getNewsFromLocal(
      {@required String category}) async {
    return repository.getNewsFromLocal(category: category);
  }
}
