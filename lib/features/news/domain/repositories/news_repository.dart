import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/features/news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, News>> getLatestNews();
}
