import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/utils/network_info.dart';
import 'package:genius_demo/features/github/data/datasources/github_local_data_source.dart';
import 'package:genius_demo/features/github/data/datasources/github_remote_data_source.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/github/domain/repositories/github_repository.dart';
import 'package:meta/meta.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubRemoteDataSource remoteDataSource;
  final GitHubLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GitHubRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GitHubResponse>>> getRepo() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await remoteDataSource.getUserRepo();
        // await localDataSource.saveUserRepo(githubResponse: remoteNews);
        return Right(remoteNews);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNews = await localDataSource.getUserRepo();
        return Right(localNews);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
