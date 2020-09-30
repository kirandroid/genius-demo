import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/news/domain/entities/news.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';

class GetLatestNews implements UseCase {
  final NewsRepository repository;

  GetLatestNews(this.repository);

  @override
  Future<Either<Failure, News>> call() async {
    return repository.getLatestNews();
  }
}
