import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';
part 'github_response.g.dart';

@HiveType(typeId: GITHUB_TID)
class GitHubResponse {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String fullName;
  @HiveField(3)
  bool private;
  @HiveField(4)
  Owner owner;
  @HiveField(5)
  String htmlUrl;
  @HiveField(6)
  String description;
  @HiveField(7)
  bool fork;
  @HiveField(8)
  String createdAt;
  @HiveField(9)
  String updatedAt;
  @HiveField(10)
  String pushedAt;
  @HiveField(11)
  String homepage;
  @HiveField(12)
  int stargazersCount;
  @HiveField(13)
  String language;
  @HiveField(14)
  int forksCount;
  @HiveField(15)
  int forks;
  @HiveField(16)
  String defaultBranch;

  GitHubResponse(
      this.id,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.homepage,
      this.stargazersCount,
      this.language,
      this.forksCount,
      this.forks,
      this.defaultBranch);

  static List<GitHubResponse> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
        .map((r) => GitHubResponse(
              r['id'],
              r['name'],
              r['full_name'],
              r['private'],
              r['owner'] != null ? new Owner.fromJson(r['owner']) : null,
              r['html_url'],
              r['description'],
              r['fork'],
              r['created_at'],
              r['updated_at'],
              r['pushed_at'],
              r['homepage'],
              r['stargazers_count'],
              r['language'],
              r['forks_count'],
              r['forks'],
              r['default_branch'],
            ))
        .toList();
  }
}

@HiveType(typeId: GITHUB_OWNER_TID)
class Owner {
  @HiveField(0)
  String login;
  @HiveField(1)
  int id;
  @HiveField(2)
  String avatarUrl;
  @HiveField(3)
  String htmlUrl;

  Owner(this.login, this.id, this.avatarUrl, this.htmlUrl);

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
