import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/hive/hive_boxes.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';

abstract class GitHubLocalDataSource {
  Future<List<GitHubResponse>> getUserRepo();
  Future<void> saveUserRepo({List<GitHubResponse> githubResponse});
}

class GitHubLocalDataSourceImpl implements GitHubLocalDataSource {
  @override
  Future<List<GitHubResponse>> getUserRepo() async {
    final githubBox = await openBox(GITHUB_BOX);
    if (githubBox.isNotEmpty) {
      final github = await githubBox.get('github');
      return github.cast<GitHubResponse>();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveUserRepo({List<GitHubResponse> githubResponse}) async {
    final githubBox = await openBox(GITHUB_BOX);
    await githubBox.put('github', githubResponse);
  }
}
