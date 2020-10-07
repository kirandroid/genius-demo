import 'dart:convert';

import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class GitHubRemoteDataSource {
  Future<List<GitHubResponse>> getUserRepo();
}

class GitHubRemoteDataSourceImpl implements GitHubRemoteDataSource {
  final http.Client client;

  GitHubRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<GitHubResponse>> getUserRepo() async {
    final response = await client.get(
      'https://api.github.com/users/kirandroid/repos',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return GitHubResponse.mapJSONStringToList(json.decode(response.body));
      // return json.decode(response.body).cast<GitHubResponse>();
    } else {
      throw ServerException();
    }
  }
}
