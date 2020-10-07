import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/usecases/usecase.dart';
import 'package:genius_demo/features/github/data/datasources/github_remote_data_source.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/github/domain/repositories/github_repository.dart';

class GetUserRepo implements UseCase {
  final GitHubRepository repository;

  GetUserRepo({this.repository});

  @override
  Future<Either<Failure, List<GitHubResponse>>> call() async {
    return repository.getRepo();
  }
}
