import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/utils/network_info.dart';
import 'package:genius_demo/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:genius_demo/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:genius_demo/features/movies/domain/repositories/movies_repository.dart';
import 'package:meta/meta.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviesResponse>> getMovies({String endpoint}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews =
            await remoteDataSource.getMovieList(endpoint: endpoint);
        await localDataSource.saveMovies(
            endpoint: endpoint, moviesResponse: remoteNews);
        return Right(remoteNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNews = await localDataSource.getMovies(endpoint: endpoint);
        return Right(localNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
