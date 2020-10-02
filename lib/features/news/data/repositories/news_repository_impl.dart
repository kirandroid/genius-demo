import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/utils/network_info.dart';
import 'package:genius_demo/features/news/data/datasources/news_local_data_source.dart';
import 'package:genius_demo/features/news/data/datasources/news_remote_data_source.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';
import 'package:meta/meta.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NewsResponse>> getLatestNews() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await remoteDataSource.getLatestNews();
        localDataSource.saveLatestNews(remoteNews);
        return Right(remoteNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNews = await localDataSource.getLatestNews();
        return Right(localNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
