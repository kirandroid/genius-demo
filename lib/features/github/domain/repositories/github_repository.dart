import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/features/github/data/datasources/github_remote_data_source.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';

abstract class GitHubRepository {
  Future<Either<Failure, List<GitHubResponse>>> getRepo();
}
