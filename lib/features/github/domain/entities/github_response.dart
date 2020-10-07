import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'github_response.g.dart';

@HiveType(typeId: GITHUB_TID)
@JsonSerializable()
class GitHubResponse {
  @HiveField(0)
  int id;
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
      {this.id,
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
      this.defaultBranch});

  static const fromJson = _$GitHubResponseFromJson;

  Map<String, dynamic> toJson() => _$GitHubResponseToJson(this);
}

@HiveType(typeId: GITHUB_OWNER_TID)
@JsonSerializable()
class Owner {
  @HiveField(0)
  String login;
  @HiveField(1)
  int id;
  @HiveField(2)
  String avatarUrl;
  @HiveField(3)
  String htmlUrl;

  Owner({
    this.login,
    this.id,
  });

  static const fromJson = _$OwnerFromJson;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
