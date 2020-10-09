import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/utils/network_info.dart';
import 'package:genius_demo/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:genius_demo/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_video_response.dart';
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
  Future<Either<Failure, MoviesResponse>> getLocalMovies(
      {String endpoint}) async {
    try {
      MoviesResponse localMovie =
          await localDataSource.getMovies(endpoint: endpoint);
      return right(localMovie);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, MoviesResponse>> getRemoteMovies(
      {String endpoint}) async {
    if (await networkInfo.isConnected) {
      try {
        MoviesResponse remoteMovie =
            await remoteDataSource.getMovieList(endpoint: endpoint);
        await localDataSource.saveMovies(
            moviesResponse: remoteMovie, endpoint: endpoint);
        return Right(remoteMovie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return getLocalMovies(endpoint: endpoint);
    }
  }

  @override
  Future<Either<Failure, MovieVideoResponse>> getMovieVideo(
      {@required String movie_id}) async {
    if (await networkInfo.isConnected) {
      try {
        MovieVideoResponse remoteMovie =
            await remoteDataSource.getMovieVideo(movie_id: movie_id);
        return Right(remoteMovie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
