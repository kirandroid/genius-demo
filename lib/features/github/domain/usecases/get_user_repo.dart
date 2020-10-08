import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/github/domain/repositories/github_repository.dart';

class GetUserRepo {
  final GitHubRepository repository;

  GetUserRepo({this.repository});

  Future<Either<Failure, List<GitHubResponse>>> getRepoFromRemote() async {
    return await repository.getRepoFromRemote();
  }

  Future<Either<Failure, List<GitHubResponse>>> getRepoFromLocal() async {
    return await repository.getRepoFromLocal();
  }
}
